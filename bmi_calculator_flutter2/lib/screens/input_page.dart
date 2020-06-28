import 'package:flutter/material.dart';
import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../widgets/bottom_button.dart';
import '../widgets/round_button.dart';
import '../constants.dart';
import 'results_page.dart';
import '../bmi.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  bool _isMetric = true;
  int height = 180;
  int weight = 80;
  int age = 19;

  void _updateGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  void _updateMeasurementValues(String measureSystem) {
    setState(() {
      if (measureSystem == 'metric' && !_isMetric) {
        _isMetric = true;
        weight = weight ~/ 2.2;
        height = (height * 2.54).round();
      } else if (measureSystem == 'imperial' && _isMetric) {
        _isMetric = false;
        weight = (weight * 2.2).round();
        height = height ~/ 2.54;
      }
    });
  }

  List<Widget> _getHeightInfo() {
    if (_isMetric) {
      return [
        Text(
          height.toString(),
          style: kNumberTextStyle,
        ),
        Text(
          'cm',
          style: kLabelTextStyle,
        ),
      ];
    } else if (!_isMetric) {
      return [
        Text(
          (height / 12).truncate().toString(),
          style: kNumberTextStyle,
        ),
        Text(
          'ft',
          style: kLabelTextStyle,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          (height.remainder(12)).toString(),
          style: kNumberTextStyle,
        ),
        Text(
          'in',
          style: kLabelTextStyle,
        ),
      ];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        actions: <Widget>[
          PopupMenuButton<String>(
            tooltip: 'Select a measurement system',
            onSelected: (String val) {
              _updateMeasurementValues(val);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'metric',
                child: Text('Metric'),
              ),
              PopupMenuItem(
                value: 'imperial',
                child: Text('Imperial'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // ***** Top row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    margin: 15,
                    tapHandler: () => _updateGender(Gender.male),
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    margin: 15,
                    tapHandler: () => _updateGender(Gender.female),
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ***** Middle row
          Expanded(
            child: ReusableCard(
              margin: 15,
              color: kActiveCardColor,
              cardChild: Column(
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
                    children: _getHeightInfo(),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: kPrimaryButtonColor,
                      overlayColor: kDimmedButtonColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: _isMetric ? kMin : kMin / 2.54,
                      max: _isMetric ? kMax : kMax / 2.54,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          // ***** Bottom row
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    margin: 15,
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT (${_isMetric ? 'kg' : 'lbs'})',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '${weight.toStringAsFixed(0)}',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    margin: 15,
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '${age.toStringAsFixed(0)}',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                              },
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
            buttonTitle: 'CALCULATE',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: BMI(
                      height: height,
                      weight: weight,
                      isMetric: _isMetric,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
