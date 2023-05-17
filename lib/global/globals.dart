import 'package:flutter/material.dart';

class Global
{
  static Color atc =  Colors.blue.withOpacity(0.6);
  static Color dtc = Colors.grey;

  static Color maleColor = dtc;
  static Color femaleColor = dtc;

  static double bmi = 0;

  static upDateColor(int data){
    if (data == 1) {
      femaleColor = atc;
      maleColor = dtc;
    } else if (data == 2) {
      femaleColor = dtc;
      maleColor = atc;
    }
  }


  static getResult() {
    if (bmi >= 25 && bmi <= 29.9) {
      return "Overweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return "Normal";
    }
    else if (bmi >= 30)
      {
        return "Obese";
      }
    else {
      return "Underweight";
    }
  }

  static getResultBMI() {
    if (bmi >= 25) {
      return "You have a higher than Normal body."
          " This BMI is between 25.0 and 39.9 and is considered overweight for an adult at this height.";
    } else if (bmi > 18) {
      return "Good job! You have Normal body,"
          " This BMI is between 18.5 and 24.9 which is considered normal for an adult at this height.";
    } else {
      return "This BMI is less than 18.4 and is considered underweight for an adult at this height.";
    }
  }

}