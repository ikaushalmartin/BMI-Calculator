import 'package:bmicalculator/calculateresult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icons_text.dart';
import 'smallcont.dart';
import 'calculateresult.dart';
import 'calculation.dart';

int age = 18;
int weight = 50;
int height = 180;
const inactivecardcolor = Color(0xff111328);
const activecardcolor = Color(0xff0a0e21);
enum gender { male, female }
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: Color(0xff0a0e21)),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = inactivecardcolor;
  Color femalecolor = inactivecardcolor;
  void updatecolor(gender num) {
    //    gender.male==inactivecardcolor?malecolor=activecardcolor; femalecolor=inactivecardcolor; :  malecolor = inactivecardcolor;  femalecolor = activecardcolor;
    if (num == gender.male) {
      femalecolor = activecardcolor;
      if (malecolor == inactivecardcolor) {
        malecolor = activecardcolor;
        femalecolor = inactivecardcolor;
      } else {
        malecolor = inactivecardcolor;
        femalecolor = activecardcolor;
      }
    }

    if (num == gender.female) {
      if (femalecolor == inactivecardcolor) {
        femalecolor = activecardcolor;
        malecolor = inactivecardcolor;
      } else {
        femalecolor = inactivecardcolor;
        malecolor = activecardcolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(gender.male);
                        });
                      },
                      child: smallcontainer(
                        malecolor,
                        containercolumn(FontAwesomeIcons.mars, 'Male'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updatecolor(gender.female);
                        });
                      },
                      child: smallcontainer(
                        femalecolor,
                        containercolumn(FontAwesomeIcons.venus, 'Female'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style:
                              TextStyle(color: Color(0xff8d8e98), fontSize: 14),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              height.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              'cm',
                              style: TextStyle(
                                color: Color(0xff8d8e98),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              thumbColor: Color(0xffeb1555),
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xff8d8e98),
                              thumbShape:
                                  RoundSliderThumbShape(enabledThumbRadius: 12),
                              overlayColor: Color(0x3eeb1555),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20)),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120,
                              max: 250,
                              onChanged: (double newvalue) {
                                setState(() {
                                  height = newvalue.round();
                                });
                              }),
                        )
                      ],
                    ),
                    margin: EdgeInsets.all(15),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xff1d1e33),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ]),
            ),
            Expanded(
                child: Row(
              children: [
                smallcontainer(
                    Color(0xff1d1e33),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Weight',
                            style: TextStyle(
                                color: Color(0xff8d8e98), fontSize: 18)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            SizedBox(
                                //width: 4,
                                ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 50,
                              ),
                            ),
                            Text(
                              'Kg',
                              style: TextStyle(
                                color: Color(0xff8d8e98),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                              iconused: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            button(
                              iconused: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
                smallcontainer(
                    Color(0xff1d1e33),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',
                            style: TextStyle(
                                color: Color(0xff8d8e98), fontSize: 18)),
                        Text(
                          age.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            button(
                              iconused: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            button(
                              iconused: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            )),
            GestureDetector(
              onTap: () {
                calculator res;
                res = calculator(weight, height);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => calculate(
                      res.getResult(),
                      res.bmi(),
                      res.getInterpretation(),
                    ),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate',
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

class button extends StatelessWidget {
  final IconData iconused;
  final Function onPressed;

  button({required this.iconused, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 50,
          height: 50,
        ),
        fillColor: Color(0xff4c4f5e),
        child: Icon(iconused),
        onPressed: () {
          onPressed();
        });
  }
}
