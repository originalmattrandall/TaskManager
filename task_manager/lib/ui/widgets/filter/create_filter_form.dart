import 'package:flutter/material.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';

class CreateFilterForm extends StatefulWidget {
  CreateFilterForm({Key key}) : super(key: key);

  _CreateFilterFormState createState() => _CreateFilterFormState();
}

class _CreateFilterFormState extends State<CreateFilterForm> {
  
  var _tags = new List<String>();
  var _dropDownMenuItems = List<DropdownMenuItem<String>>();
  var _currentSelection = "";

  @override
  void initState() { 
    super.initState();
    TagDBHelper().queryAllRows().then((value) {
      setState(() {
        for(var item in value){
          _tags.add(item[TagDBHelper.name]);
        }

        _tags = _tags.toSet().toList();
        _dropDownMenuItems = getMenuItems(_tags);
        _currentSelection = getInitialTag();        
      });
    });
  }

  String getInitialTag(){
    var result = "";
    if(_tags.length > 0)
      result = _tags[0];

    return result;
  }

  @override
  Widget build(BuildContext context) {
    
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).backgroundColor;
    final hintColor = Theme.of(context).hintColor;

    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();

    var underLineBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      )
    );

    final double outerContainerWidth = MediaQuery.of(context).size.width*0.86;

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
                      color: Colors.lightBlue,
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
                          color: Colors.lightBlue,
                          decoration: TextDecoration.none
                        ),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.lightBlue),
                          hintStyle: TextStyle(color: Colors.lightBlue[100]),
                          labelText: "Filter Title",
                          hintText: "Enter a title for the filter",
                          enabledBorder: underLineBorder,
                          focusedBorder: underLineBorder,
                          errorBorder: underLineBorder,
                          focusedErrorBorder: underLineBorder
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Any name you want! But you gotta add one";
                          }
                          return null;
                        },
                      ),

                      // TODO: remove items from list when selected and add them to a section
                      // below showing chosen tags                  
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsetsGeometry.lerp(EdgeInsets.all(0), EdgeInsets.all(1), 10),
                          enabledBorder: underLineBorder,
                          focusedBorder: underLineBorder,
                          errorBorder: underLineBorder,
                          focusedErrorBorder: underLineBorder
                        ),
                        value: _currentSelection,
                        items: _dropDownMenuItems,
                        onChanged: (String value) {
                          setState(() {
                            print(value);
                          });
                        },
                      ),
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
          color: Colors.lightBlue,
          textColor: Colors.white,
          onPressed: () {
            if(formKey.currentState.validate()){

              titleController.clear();
              Navigator.pop(context);
            };
          },
          child: Text(
            "Submit"
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> getMenuItems(List<String> list){
    print("Inside getMenuItems");
    return list.map((String item){
      return DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: 18,
          ),
        ),
      );
    }).toList();
  }
}