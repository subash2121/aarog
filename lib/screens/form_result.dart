import 'package:aarog/bmi/input_page.dart';
import 'package:aarog/screens/medicine.dart';
import 'package:aarog/screens/notifications.dart';
import 'package:aarog/screens/period_tracker.dart';
import 'package:flutter/material.dart';
import 'package:aarog/widgets/model.dart';
import 'package:aarog/widgets/card.dart';
import 'package:aarog/widgets/tips.dart';
import 'dart:math';
import 'package:aarog/bmi/input_page.dart';
import 'gender.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
class Result extends StatefulWidget {
  static Gender gender=Gender();



  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Tips tip =Tips();
 String namee;
  //var gg=Gender.genderr;


  int GetRandomNumber(){
    Random random=Random();
    int num=random.nextInt(19);
    return num;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/gender.txt');
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
  String name;

  String checkGender(){
    if (readCounter()==1){
      return "Period\nTracker";

    }else{
      return "Gym\nTracker";
    }
  }
  String checkGenderr(){
    if (readCounter()==1){
      return "Welcome back lady";

    }else{
      return "Welcome back bro";
    }
  }
  Future<File> get _localFilee async {
    final path = await _localPath;
    return File('$path/data.txt');
  }
  Future<String> readCounterr() async {
    try {
      final file = await _localFilee;

      // Read the file.
      String contents = await file.readAsString();

      return await (contents);
    } catch (e) {
      // If encountering an error, return 0.
      return '0';
    }

  }
  getName() async{
    if (readCounterr()!=null){
      return 'There';
    }
  }

  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.lightBlueAccent,

      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),


            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Text('HEY ',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w200),),
                  Flexible(child: Text(checkGenderr().toUpperCase(), style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w200))),
                  Text(' !',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w200),),

                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: card(colour: Colors.white,cardChild: Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(checkGender(),textAlign: TextAlign.center,style:
                        TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 30,

                        ),)),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return HomePage();
                        }));
                      },
                    ),
                  ),
                  Expanded(

                    child: GestureDetector(
                      child: card(colour: Colors.white,cardChild: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text('Physical\nFitness',textAlign: TextAlign.center,style:
                      TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30,

                      ),)),),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return InputPage();
                        }));
                      },
                    ),
                  ),
                ],

              ),
            ),
            Container(
              child: GestureDetector(
                child: card(colour: Colors.white,cardChild: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text('Medicine delivery',textAlign: TextAlign.center,style:
                    TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 30,

                    ),)),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Medicine();
                  }));
                },
              ),

            ),
              Expanded(
                flex: 2,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text('Health Tip'.toUpperCase(),
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                        fontSize: 30
                      ),),
                    ),

                    Center(child: Text(tip.tips[GetRandomNumber()],textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),))
                  ],
                ),
              ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                child: card(colour: Colors.white,cardChild: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('Reminder',textAlign: TextAlign.center,style:
                      TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30,

                      ),),
                    )),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return Notifications();
                  }));
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),


//            Text(model.age.toString(), style: TextStyle(fontSize: 22)),
//            Text(model.bloodgroup, style: TextStyle(fontSize: 22)),
//            Text(model.address, style: TextStyle(fontSize: 22)),
//            Text(model.contact.toString(), style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    ));
  }
}