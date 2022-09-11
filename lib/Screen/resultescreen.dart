import 'package:flutter/material.dart';
import 'package:spinkit_demo/componet/reuseablecard.dart';

class ResulteScreen extends StatefulWidget {
  final String? bmi;
  final String? resulte;
  final String? feedback;
  final int? age;
  const ResulteScreen({Key? key, this.bmi, this.resulte, this.feedback, this.age})
      : super(key: key);
  @override
  State<ResulteScreen> createState() => _ResulteScreenState();
}

class _ResulteScreenState extends State<ResulteScreen> {
  final Color color = const Color(0xff1d1e33);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              child: Text(
                'Resulte',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ReuseableCard(
            color: color,
            radius: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                SizedBox(
                  child: Text(
                    widget.resulte.toString(),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink),
                  ),
                ),
                Text(
                  '${widget.age.toString()} years old !',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.bmi.toString(),
                  style: const TextStyle(
                      fontSize: 60, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.feedback.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                minimumSize: const Size(double.infinity, 50)),
            child: const Text("Re-calculate"),
          ),
        ],
      ),
    );
  }
}
