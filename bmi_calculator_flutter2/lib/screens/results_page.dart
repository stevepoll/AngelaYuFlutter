import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/reusable_card.dart';
import '../widgets/bottom_button.dart';
import '../bmi.dart';

class ResultsPage extends StatelessWidget {
  final BMI bmi;

  ResultsPage({@required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTS'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 15),
                      color: kInactiveCardColor,
                      child: Text(
                        'Your Result',
                        style: kTitleTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        color: kInactiveCardColor,
                        child: ReusableCard(
                          margin: 0,
                          color: kActiveCardColor,
                          cardChild: Column(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '${bmi.result.toUpperCase()}',
                                  style: kResultTextStyle,
                                  strutStyle: StrutStyle(
                                    height: 4.5,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  '$bmi',
                                  style: kBmiTextStyle,
                                ),
                              ),
                              Text(
                                'Normal BMI range:',
                                style: kLabelTextStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Expanded(
                                child: Text(
                                  '18.5 - 25',
                                  style: kPlainTextStyle,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Text(
                                    '${bmi.interpretation}',
                                    style: kPlainTextStyle,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 15),
                                child: RaisedButton(
                                  color: kInactiveCardColor,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 50,
                                  ),
                                  elevation: 0,
                                  child: Text(
                                    'SAVE RESULT',
                                    style: TextStyle(
                                        fontSize: 18, letterSpacing: 1.2),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'RECALCULATE BMI',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
