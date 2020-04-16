import 'package:flutter/material.dart';
import 'package:task_manager/data/resources/databasehelpers/filter_db_helper.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';
import 'package:task_manager/ui/widgets/tag/tag.dart';

class CreateFilterForm extends StatefulWidget {
  CreateFilterForm({Key key}) : super(key: key);

  _CreateFilterFormState createState() => _CreateFilterFormState();
}

class _CreateFilterFormState extends State<CreateFilterForm> {
  var _tags = new List<String>();
  var _dropDownMenuItems = List<DropdownMenuItem<String>>();
  var _tagsToFilterOn = List<String>();
  var filterDbHelper = new FilterDbHelper();

  List<DropdownMenuItem<String>> getMenuItems(List<String> list) {
    return list.map((String item) {
      return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            // color: Colors.lightBlue,
            fontSize: 18,
          ),
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    TagDBHelper().queryAllRows().then((value) {
      setState(() {
        print("init state");
        for (var item in value) {
          _tags.add(item[TagDBHelper.name]);
        }

        _tags = _tags.toSet().toList();
        _dropDownMenuItems = getMenuItems(_tags);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).backgroundColor;
    final accentColor = Theme.of(context).accentColor;
    
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();

    final double outerContainerWidth = MediaQuery.of(context).size.width * 0.86;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: outerContainerWidth,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create New Filter",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        style: TextStyle(
                            decoration: TextDecoration.none),
                        decoration: InputDecoration(
                          labelText: "Filter Title",
                          hintText: "Enter a title for the filter",
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Any name you want! But you gotta add one";
                          }
                          return null;
                        },
                      ),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsGeometry.lerp(
                              EdgeInsets.all(0), EdgeInsets.all(1), 10),
                        ),
                        hint: Text(
                          "Select Tags to filter on",
                          style: TextStyle(
                            color: accentColor,
                          ),
                        ),
                        items: _dropDownMenuItems,
                        onChanged: (String value) {
                          setState(() {
                            _tagsToFilterOn.add(value);
                            _dropDownMenuItems.removeWhere(
                                (menuItem) => menuItem.value == value);
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(22),
                      ),
                      Tag().getTagWidgets(_tagsToFilterOn),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 40,
        child: MaterialButton(
          color: primaryColor,
          textColor: secondaryColor,
          onPressed: () {
            if (formKey.currentState.validate()) {
              var filterRow = {FilterDbHelper.name: titleController.value.text};

              filterDbHelper.insertWithTags(filterRow, _tagsToFilterOn);

              titleController.clear();
              Navigator.pop(context);
            }
          },
          child: Text("Submit"),
        ),
      ),
    );
  }
}
