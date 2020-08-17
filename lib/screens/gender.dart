import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aarog/widgets/card.dart';
import 'package:aarog/widgets/gender_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
const activeCardColour=Colors.white;
const inactiveCardColour=Colors.blueGrey;
class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}
enum GenderName {
  male,
  female,
}


class _GenderState extends State<Gender> {
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
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/gender.txt');
  }
  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file.
    return file.writeAsString('$counter');
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



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Choose Your Gender',
            textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Colors.white
          ),),

          SizedBox(
            height: 20.0,
          ),
          Text(genderr.toString(),
          style: TextStyle(fontSize: 25.0,
          letterSpacing: 2.0,
          fontWeight: FontWeight.w100,
          color: Colors.white),),
          Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      genderr='Welcome Sir';
                      updateColour(GenderName.male);
                    });
                  },
                  child: card(colour: maleCardColour,
                  cardChild: gender(genicon: FontAwesomeIcons.mars,genname: 'MALE',),),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      genderr='Welcome Madam';
                      updateColour(GenderName.female);
                    });
                  },
                  child: card(colour: femaleCardColour,
                    cardChild: gender(genicon: FontAwesomeIcons.venus,genname: 'FEMALE',),),
                ),
              ),


            ],
          ),


          GestureDetector(
            onTap: (){
              setState(() {
                genderr='Welcome';
                otherCardColour=activeCardColour;
                maleCardColour=inactiveCardColour;
                femaleCardColour=inactiveCardColour;


              });
            },
            child: card(colour: otherCardColour,

              cardChild: gender(genicon: Icons.cached,genname: 'OTHER',),),
          ),
          SizedBox(
            height: 50.0,
          ),

          FlatButton(onPressed: (){
            if (genderr=='Welcome Sir'){
              writeCounter(1);
            }else{
              writeCounter(2);
            }


            Navigator.pushNamed(context, '/form');
          }, child: Container(decoration:BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
              padding:EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),child: Text('Proceed',
                style: TextStyle(color: Colors.lightBlueAccent),)),
          ),

        ],
      ),
    );
  }
}
