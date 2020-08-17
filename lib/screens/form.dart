import 'package:flutter/material.dart';
import 'package:aarog/screens/form_result.dart';
import 'package:validators/validators.dart' as validator;
import 'package:aarog/widgets/model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: TestForm(),
      ),
    );
  }
}
class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}
class _TestFormState extends State<TestForm> {

  final myController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  @override
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }
  Future<File> writeCounter(String counter) async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString(counter);
  }


//  _read() async {
//    try {
//      final directory = await getApplicationDocumentsDirectory();
//      final file = File('${directory.path}/my_file.txt');
//      String text = await file.readAsString();
//      print(text);
//    } catch (e) {
//      print("Couldn't read file");
//    }
//  }
//
//  _save() async {
//    final directory = await getApplicationDocumentsDirectory();
//    final file = File('${directory.path}/my_file.txt');
//    final text = 'Hello World!';
//    await file.writeAsString(text);
//    print('saved');
//  }
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override


  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Form(
      key: _formKey,
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('How Can We Call You?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 20.0,),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      model.firstName = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Age',
                        contentPadding: EdgeInsets.all(15.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                      autovalidate: true,
                      keyboardType: TextInputType.number,
                      validator: (input) {
                        final isDigitsOnly = int.tryParse(input);
                        return isDigitsOnly == null
                            ? 'Input needs to be digits only'
                            : null;
                      },



//                    validator: (value) {
//                      if (value==null) {
//                        return 'Enter age';
//                      }
//                      return null;
//                    },
                      onSaved: (value) {
                        model.age = int.parse(value);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          MyTextFormField(
            hintText: 'Blood Group',
            isEmail: true,
            validator: (String value) {
              if (value=null) {
                return 'Please enter a Blood Group';
              }
              return null;
            },
            onSaved: (String value) {
              model.bloodgroup = value;
            },
          ),
          MyTextFormField(
            hintText: 'Address',

            validator: (String value) {
              if (value=null) {
                return 'Please enter a address';
              }
              //_formKey.currentState.save();
              return null;
            },
            onSaved: (String value) {
              model.address = value;
            },
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(

              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Contact Number',
              ),

              validator: (input) {
                final isDigitsOnly = int.tryParse(input);
              },
              onSaved: (value){
                model.contact=int.parse(value);
              },
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          RaisedButton(
            color: Colors.white,
            onPressed: () {
              writeCounter(model.firstName);



             // if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result()));
              //}
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.lightBlueAccent,
              ),
            ),
          )
        ],
      ),
    );

  }
}
class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isPassword;
  final bool isEmail;
  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(

        decoration: InputDecoration(

          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}