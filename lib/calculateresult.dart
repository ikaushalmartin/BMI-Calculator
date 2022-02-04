import 'package:flutter/material.dart';

import 'smallcont.dart';

class calculate extends StatelessWidget {
  calculate(this.bmiresult, this.resulttext, this.interpretation);

  final String bmiresult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xff0a0e21)),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Your Result',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w900),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff1d1e33),
                ),
                margin:
                    EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiresult,
                      style: textstyle,
                    ),
                    Text(resulttext, style: centertext),
                    Text(
                      interpretation,
                      style: descstyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true).pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Re-Calculate',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 20),
                color: Color(0xffeb1555),
                width: double.infinity,
                height: 80,
              ),
            )
          ],
        ),
      ),
    );
  }
}
