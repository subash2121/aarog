import 'package:aarog/screens/form_result.dart';
import 'package:aarog/screens/picture_medication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarog/widgets/card.dart';
import 'package:aarog/widgets/gender_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
const activeCardColour=Colors.white;
const inactiveCardColour=Colors.blueGrey;
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}
enum GenderName {
  male,
  female,
}


class _NotificationsState extends State<Notifications> {
  static String genderr;
  Color maleCardColour=inactiveCardColour;
  Color femaleCardColour=inactiveCardColour;
  Color otherCardColour=inactiveCardColour;
  void updateColour(GenderName gender){
    if (gender==GenderName.male){
      setState(() {
        otherCardColour=inactiveCardColour;
      });
//      setState(() {
//        genderr='male';
//      });

      if (maleCardColour==inactiveCardColour){
        maleCardColour=activeCardColour;
        femaleCardColour=inactiveCardColour;
      }
      else{
        maleCardColour=inactiveCardColour;
      }
    }
    else if (gender==GenderName.female){
      setState(() {
        otherCardColour=inactiveCardColour;
      });
//      setState(() {
//        genderr='female';
//      });

      if (femaleCardColour==inactiveCardColour){
        femaleCardColour=activeCardColour;
        maleCardColour=inactiveCardColour;
      }
      else{
        femaleCardColour=inactiveCardColour;
      }
    }
  }

  @override
//  Future<String> get _localPath async {
//    final directory = await getApplicationDocumentsDirectory();
//
//    return directory.path;
//  }
//  Future<File> get _localFile async {
//    final path = await _localPath;
//    return File('$path/gender.txt');
//  }
//  Future<File> writeCounter(int counter) async {
//    final file = await _localFile;
//
//    // Write the file.
//    return file.writeAsString('$counter');
//  }
//  Future<int> readCounter() async {
//    try {
//      final file = await _localFile;
//
//      // Read the file.
//      String contents = await file.readAsString();
//
//      return int.parse(contents);
//    } catch (e) {
//      // If encountering an error, return 0.
//      return 0;
//    }
//  }



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Do you want to recieve notifications on your health?',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),
          ),

          SizedBox(
            height: 20.0,
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {

                      updateColour(GenderName.male);
                    });
                  },
                  child: card(colour: maleCardColour,
                    cardChild: gender(genicon: Icons.check,genname: 'YES',),),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {

                      updateColour(GenderName.female);
                    });
                  },
                  child: card(colour: femaleCardColour,
                    cardChild: gender(genicon: Icons.clear,genname: 'NO',),),
                ),
              ),


            ],
          ),


          SizedBox(
            height: 50.0,
          ),

          FlatButton(onPressed: (){
//            if (genderr=='Welcome Sir'){
//              writeCounter(1);
//            }else{
//              writeCounter(2);
//            }


            Navigator.pop(context);
          }, child: Container(decoration:BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
              padding:EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),child: Text('Back',
                style: TextStyle(color: Colors.lightBlueAccent),)),
          ),

        ],
      ),
    );
  }
}
