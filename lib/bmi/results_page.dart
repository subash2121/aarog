import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({this.bmiAnswer,this.bmiInterpretation,this.bmiResult});
  final String bmiResult;
  final String bmiAnswer;
  final String bmiInterpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 15.0),
            child: Text('Your Result',
              style: TextStyle(fontSize: 50.0,
                fontWeight: FontWeight.bold,

              ),),
          ),),
          Expanded(flex:5,child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Color(0xFF1D1E33),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(bmiResult,
                  style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.tealAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(bmiAnswer,

                  style: TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.w900,

                  ),),
                Text(bmiInterpretation,
                  style: TextStyle(fontSize: 15.0),)
              ],
            ),


          ),),
          Expanded(child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return InputPage();
              },),);
            },
            child: Container(
              color: bottomContainerColour,
              width: double.infinity,
              child: Center(child: Text('RE-CALCULATE',style: LargeButtonTextStyle,)),
            ),
          ),)
        ],
      ),
    );
  }
}
