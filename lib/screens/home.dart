import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'form_result.dart';
import 'package:aarog/widgets/model.dart';
class Home extends StatelessWidget {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/data.txt');
  }
  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file.
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }
  bool test(){
    if (readCounter()==null){
      return false;
    }else{
      return true;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(tag: 'logo', child: Container(child: Image.asset('images/icon.jpeg'),height: 60.0,),
              ),

//              Icon(Icons.local_hospital,
//              color: Colors.white,
//              size: 80.0,),
              SizedBox(
                height: 20.0,
              ),
              Text('AAROG',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),),
              SizedBox(
                height: 40.0,
              ),
              FlatButton(onPressed: (){
                Navigator.pushNamed(context, '/login');
              }, child: Container(
                  decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
                  padding:EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),child: Text('Login',
                  style: TextStyle(color: Colors.lightBlueAccent),)),
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton(onPressed: (){
                Navigator.pushNamed(context, '/reg');
              }, child: Container(
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30.0),
                    ),
                    color: Colors.white,
                  ),
                  padding:EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),child: Text('Register',
                style: TextStyle(color: Colors.lightBlueAccent),)),
              ),
//              FlatButton(onPressed: (){
//                if(test()){
//                  Navigator.push(context, MaterialPageRoute(builder: (context){
//                    return Result();
//                  }));
//                }else{
//                  Navigator.pushNamed(context, '/gender');
//                }
//
//
//              }, child: Container(decoration:BoxDecoration(
//                borderRadius: BorderRadius.all(Radius.circular(30.0),
//                ),
//                color: Colors.white,
//              ),
//                  padding:EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),child: Text('Start',
//                  style: TextStyle(color: Colors.lightBlueAccent),)),
//              )
            ],
          ),
        ),
      )

    );
  }
}
