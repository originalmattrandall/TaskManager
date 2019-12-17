import 'package:flutter/material.dart';
import 'package:task_manager/data/bloc/group_bloc.dart';
import 'package:task_manager/data/models/group.dart';

class CreateGroupForm extends StatefulWidget {
  CreateGroupForm({Key key}) : super(key: key);

  _CreateGroupFormState createState() => _CreateGroupFormState();
}

class _CreateGroupFormState extends State<CreateGroupForm> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  UnderlineInputBorder underLineBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.lightBlue
    )
  );

  @override
  Widget build(BuildContext context) {

    final double outerContainerWidth = MediaQuery.of(context).size.width*0.86;

    return Container(
       child: Scaffold(
         body: SingleChildScrollView(
           child: Center(
             child: Container(
              width: outerContainerWidth,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Create a New Group",
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
                            labelText: "Title",
                            hintText: "Title of the Group",
                            enabledBorder: underLineBorder,
                            focusedBorder: underLineBorder,
                            errorBorder: underLineBorder,
                            focusedErrorBorder: underLineBorder
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "-_- Just add a title...";
                            }
                            return null;
                          },
                        ),
                        
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),

                        TextFormField(
                          minLines: 1,
                          maxLines: 6,
                          controller: _descriptionController,
                          style: TextStyle(
                            color: Colors.lightBlue,
                            decoration: TextDecoration.none
                          ),
                          decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.lightBlue),
                          hintStyle: TextStyle(color: Colors.lightBlue[100]),
                            labelText: "Description",
                            hintText: "What tasks are contained within?",
                            enabledBorder: underLineBorder,
                            focusedBorder: underLineBorder,
                            errorBorder: underLineBorder,
                            focusedErrorBorder: underLineBorder
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "This will help you remember what to do";
                            }
                            return null;
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
                print(_descriptionController.text);
                GroupModel insertThisGroup = GroupModel(
                  name: _titleController.text,
                  description: _descriptionController.text,
                );
                groupBloc.insertSingleGroup(insertThisGroup);
                _titleController.clear();
                _descriptionController.clear();
                Navigator.pop(context);
              }
            },
            child: Text(
              "Submit"
            ),
          ),
        ),
      ),
    );
  }
}