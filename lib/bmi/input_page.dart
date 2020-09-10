import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'card.dart';
import 'results_page.dart';
import 'calculator_brain.dart';
const activeCardColour=Colors.lightBlueAccent;
const inactiveCardColour=Colors.black26;
const bottomContainerColour=Color(0xFFEB1555);
const bottomContainerHeight=80.0;
const numberStyle=TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);
const LargeButtonTextStyle=TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const labelTextStyle=TextStyle(
  fontSize: 18.0,
  color:Color(0xFF8D8E98),
);
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum GenderName {
  male,
  female,
}
class _InputPageState extends State<InputPage> {
  Color maleCardColour=inactiveCardColour;
  Color femaleCardColour=inactiveCardColour;
  int height=180;
  int weight=60;
  int age=20;
  void updateColour(GenderName gender){
    if (gender==GenderName.male){
      if (maleCardColour==inactiveCardColour){
        maleCardColour=activeCardColour;
        femaleCardColour=inactiveCardColour;
      }
      else{
        maleCardColour=inactiveCardColour;
      }
    }
    else if (gender==GenderName.female){
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(GenderName.male);
                  });

                },
                child: card(
                  colour:maleCardColour,
                  cardChild: gender(genicon: FontAwesomeIcons.mars,genname: 'MALE',),
                ),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: (){
                  setState(() {
                    updateColour(GenderName.female);;
                  });
                },
                child: card(colour:femaleCardColour,
                  cardChild: gender(genicon: FontAwesomeIcons.venus, genname: 'FEMALE'),),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: card(colour:activeCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Text('HEIGHT',
                  style: labelTextStyle,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(),style: numberStyle),
                    Text('cm',style:labelTextStyle),

                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0 ),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double newValue){
                      setState(() {
                        height=newValue.round();
                      });
                    },
                    //activeColor: Colors.white,
                    min: 100.0,
                    max:220.0,
                  ),
                ),
              ],
            ),)
          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: card(
                colour:activeCardColour,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('WEIGHT',style:labelTextStyle
                    ),
                    Text(weight.toString(),style:numberStyle
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(icon:FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight=weight-1;
                            });
                          },),
//                        FloatingActionButton(
//                          backgroundColor: Color(0xFF4C4F5E),
//                          child: Icon(Icons.add,
//                            color: Colors.white,),
//                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(icon:FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight=weight+1;
                            });
                          },),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              Expanded(child:card(colour:activeCardColour,cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('AGE',style:labelTextStyle
                  ),
                  Text(age.toString(),style:numberStyle
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RoundIconButton(icon:FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            age--;
                          });
                        },),
//                        FloatingActionButton(
//                          backgroundColor: Color(0xFF4C4F5E),
//                          child: Icon(Icons.add,
//                            color: Colors.white,),
//                        ),
                      SizedBox(
                        width: 10.0,
                      ),

                      RoundIconButton(icon:FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            age++;
                          });
                        },),

                    ],
                  ),

                ],

              ),)),
            ],
          ),),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);

              Navigator.push(context, MaterialPageRoute(builder:(context){
                return ResultsPage(bmiAnswer:calc.calculateBMI() ,
                  bmiInterpretation: calc.getInterpretation(),
                  bmiResult: calc.getResult(),);

              }));
            },
            child: Container(
              color: bottomContainerColour,
              height: bottomContainerHeight,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text('CALCULATE',style: LargeButtonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width:56.0,
        height:56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




