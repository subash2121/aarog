import 'package:flutter/material.dart';
class gender extends StatelessWidget {
  gender({@required this.genicon,@required this.genname});
  final IconData genicon;
  final String genname;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Icon(
          genicon,
          size:80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(genname,style: TextStyle(
          fontSize: 18.0,
          color:Color(0xFF8D8E98),

        ),)
      ],
    );
  }
}