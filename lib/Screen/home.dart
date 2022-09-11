import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spinkit_demo/Screen/resultescreen.dart';
import 'package:spinkit_demo/calculator/calculator.dart';
import 'package:spinkit_demo/logic/bmicalculate.dart';

import '../componet/iconwidget.dart';
import '../componet/rawbutton.dart';
import '../componet/reuseablecard.dart';

enum GenderSelection { male, female }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color inActiveColor = const Color(0xff1d1e33);
  final Color activeColor = const Color(0x011d1e33);
  GenderSelection? genderSelection;
  final Color color = const Color(0xff1d1e33);
  final Color darkcolor = const Color(0xff0a0321);
  final Color secondary = Colors.pink;
  int height = 120;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bmi calculator".toUpperCase()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Calculator()));
              },
              icon: const Icon(FontAwesomeIcons.calculator))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                ReuseableCard(
                  color: genderSelection == GenderSelection.male
                      ? activeColor
                      : inActiveColor,
                  radius: 10,
                  child: const IconWidget(
                    icon: FontAwesomeIcons.mars,
                    text: "MALE",
                  ),
                  onPressed: () {
                    setState(() {
                      genderSelection = GenderSelection.male;
                    });
                  },
                ),
                ReuseableCard(
                  color: genderSelection == GenderSelection.female
                      ? activeColor
                      : inActiveColor,
                  radius: 10,
                  child: const IconWidget(
                    icon: FontAwesomeIcons.venus,
                    text: "FEMALE",
                  ),
                  onPressed: () {
                    setState(() {
                      genderSelection = GenderSelection.female;
                    });
                  },
                ),
              ],
            ),
          ),
          ReuseableCard(
            color: color,
            radius: 10,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  text: "HEIGHT",
                  size: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Text(
                        height.toString(),
                        style: const TextStyle(
                            fontSize: 47, fontWeight: FontWeight.bold),
                      ),
                    ),
                     const TextWidget(
                      text: "cm",
                      
                    ),
                   
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                  trackHeight: 2,
                  activeTrackColor: Colors.white,
                  thumbColor: const Color(0xffeb1555),
                  overlayColor: const Color(0x15eb1555),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                  max: 220,
                  min: 120,
                  value: height.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      height = value.toInt();
                    });
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReuseableCard(
                  color: color,
                  radius: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text("WEIGHT"),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Text(
                              weight.toString(),
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            child: Text(
                              "kg",
                              //style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawButton(
                            color: darkcolor,
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          RawButton(
                            color: darkcolor,
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ReuseableCard(
                  color: color,
                  radius: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text("AGE"),
                      ),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Text(
                              age.toString(),
                              style: const TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            child: Text(
                              "yr",
                              //style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RawButton(
                            color: darkcolor,
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          RawButton(
                            color: darkcolor,
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              CalculateBMI calculateBMI =
                  CalculateBMI(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResulteScreen(
                      bmi: calculateBMI.calculateBMI(),
                      resulte: calculateBMI.resulte(),
                      feedback: calculateBMI.feedback(),
                      age: calculateBMI.agedisplay(age),
                    ),
                  ));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                minimumSize: const Size(double.infinity, 50)),
            child:  Text("Calculate".toUpperCase()),
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final double size;
  const TextWidget({
    Key? key,
    required this.text,this.size = 16,
 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        style: TextStyle(fontSize: size),
      ),
    );
  }
}
