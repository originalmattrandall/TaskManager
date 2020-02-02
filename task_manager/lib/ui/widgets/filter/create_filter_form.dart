import 'package:flutter/material.dart';
import 'package:task_manager/data/resources/databasehelpers/tags_db_helper.dart';

class CreateFilterForm extends StatefulWidget {
  CreateFilterForm({Key key}) : super(key: key);

  _CreateFilterFormState createState() => _CreateFilterFormState();
}

class _CreateFilterFormState extends State<CreateFilterForm> {
  
  var _tags = new List<String>();

  @override
  void initState() { 
    super.initState();
    TagDBHelper().queryAllRows().then((value) {
      for(var item in value){
        _tags.add(item[TagDBHelper.name]);
      }
    });
    _tags = _tags.toSet().toList();
  }

  String getInitialTag(){
    var result = "";
    if(_tags.length > 0)
      result = _tags[0];

    return result;
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    final _titleController = TextEditingController();

    UnderlineInputBorder underLineBorder = const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.lightBlue
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
                  key: _formKey,            
                  child: Column(          
                    children: [
                      TextFormField(
                        controller: _titleController,
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
                        value: getInitialTag(),
                        items: _tags.map((String item){
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
                        }).toList(), 
                        onChanged: (String value) {

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
            if(_formKey.currentState.validate()){

              _titleController.clear();
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
}