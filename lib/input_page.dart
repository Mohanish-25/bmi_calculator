// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 66.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
// 1 = male, 2 = female
  void updateColor(int Gender) {
    //male card pressed
    if (Gender == 1) {
      if (malecardColor == inactiveCardColor) {
        malecardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        malecardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      }
    }
//female card pressed
    if (Gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        malecardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
        malecardColor = activeCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(1);
                        });
                      },
                      child: ReusableCard(
                        colour: malecardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(2);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: activeCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              height: bottomContainerHeight,
              width: double.infinity,
              color: bottomContainerColor,
            ),
          ],
        ),
      ),
    );
  }
}
