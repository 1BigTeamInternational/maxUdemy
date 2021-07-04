import 'package:bmicalculator/Components/bottombutton.dart';
import 'package:bmicalculator/Components/gendercardcontent.dart';
import 'package:bmicalculator/calculatebmi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/Components/ReusableCard.dart';
import 'package:bmicalculator/constant.dart';
import 'package:bmicalculator/Components/roundiconbutton.dart';
import 'package:bmicalculator/screens/resultpage.dart';

//Enumeration of Human Gender for better understanding
//Cant do enum in classes
enum Human {
  male,
  female,
}

class BMIApp extends StatefulWidget {
  @override
  _BMIAppState createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {
  Human human;
  int maleCardBGColor = kInactiveCardBGColor;
  int femaleCardBGColor = kInactiveCardBGColor;
  int height = kDefaultHeight;
  int weight = kDefaultWeight;
  int age = kDefaultAge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        human = Human.male;
                      });
                    },

                    //The reason why to use Tenary Operators is that you can assign the values of the result
                    //of the Tenary Operator to a variable or property unlike if-else statement
                    color: human == Human.male
                        ? kActiveCardBGColor
                        : kInactiveCardBGColor,

                    child: GenderCardContent(
                        gender: 'MALE', icon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        human = Human.female;
                      });
                    },
                    color: human == Human.female
                        ? kActiveCardBGColor
                        : kInactiveCardBGColor,
                    child: GenderCardContent(
                        gender: 'FEMALE', icon: FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardBGColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(kThumbSliderColor),
                      overlayColor: Color(kOverlaySliderColor),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBGColor,
                    //child: BottomCardContent(label: 'WEIGHT', displayNum: 70),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                              fillColor: Color(kRoundIconButtonBGColor),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              fillColor: Color(kRoundIconButtonBGColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardBGColor,
                    //child: BottomCardContent(label: 'AGE',displayNum: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                              fillColor: Color(kRoundIconButtonBGColor),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                              fillColor: Color(kRoundIconButtonBGColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              CalculateBMI bmi = CalculateBMI(height: height, weight: weight);
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context) => ResultPage(result: bmi.getResult()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
