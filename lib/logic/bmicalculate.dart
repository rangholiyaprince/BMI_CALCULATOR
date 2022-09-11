import 'dart:math';

class CalculateBMI {
  final int? height;
  final int? weight;
  final int? age;
  double bmi = 0.0;

  CalculateBMI({
    this.height,
    this.age,
    this.weight,
  });
  String? calculateBMI() {
    bmi = weight! / pow(height! / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String? resulte() {
    if (bmi >= 25) {
      return 'Overweight 👊';
    } else if (bmi > 18.5) {
      return 'Normal 👍';
    } else {
      return 'Underweight 👎';
    }
  }

  int? agedisplay(int age) {
    return age;
  }

  String? feedback() {
    if (bmi >= 25) {
      return "You have a higher than normal body weight weight.\nTry to Exersices more. Those who are overweight(BMI of 25 to 29.9). it is recommended that you Lose weight.";
    } else if (bmi > 18.5) {
      return "You have a normal body weight.congretulations...!!";
    } else {
      return "Eat more frequently. you are underWeight.\n Eat may you feel full faster.";
    }
  }
}
