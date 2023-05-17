import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';

import '../global/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeightSliderController sliderController;

  double cm = 180;
  int weight = 54;
  int age = 18;

  @override
  void initState() {
    sliderController =
        WeightSliderController(initialWeight: cm, minWeight: 0, interval: 0.1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Global.upDateColor(2);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Global.maleColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: const AssetImage("assets/images/man.png"),
                              height: size.height * 0.16,
                              fit: BoxFit.cover,
                            ),
                            const Expanded(
                                child: Text(
                              "Male",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          Global.upDateColor(1);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Global.femaleColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: const AssetImage("assets/images/girl.png"),
                              height: size.height * 0.16,
                              fit: BoxFit.cover,
                            ),
                            const Expanded(
                              child: Text(
                                "Female",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: cm.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2b00d4),
                            ),
                          ),
                          const TextSpan(
                            text: " cm",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                    VerticalWeightSlider(
                      controller: sliderController,
                      height: 60,
                      isVertical: false,
                      decoration: PointerDecoration(
                        width: 130.0,
                        height: 3.0,
                        largeColor: Colors.black,
                        mediumColor: Colors.blueGrey,
                        smallColor: Colors.grey.shade300,
                        gap: 30,
                      ),
                      onChanged: (double value) {
                        setState(() {
                          cm = value;
                        });
                      },
                      indicator: Container(
                        height: 5.0,
                        width: 200.0,
                        alignment: Alignment.centerLeft,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2b00d4),
                            ),
                          ),
                          StepperSwipe(
                            initialValue: weight,
                            iconsColor: Colors.black,
                            withBackground: true,
                            speedTransitionLimitCount: 3,
                            firstIncrementDuration:
                                const Duration(milliseconds: 300),
                            secondIncrementDuration:
                                const Duration(milliseconds: 100),
                            direction: Axis.horizontal,
                            dragButtonColor: Colors.blueAccent,
                            withSpring: true,
                            maxValue: 100,
                            minValue: 1,
                            withFastCount: true,
                            stepperValue: weight,
                            onChanged: (val) {
                              setState(() {
                                weight = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff2b00d4),
                            ),
                          ),
                          StepperSwipe(
                            initialValue: age,
                            iconsColor: Colors.black,
                            withBackground: true,
                            speedTransitionLimitCount: 3,
                            firstIncrementDuration:
                                const Duration(milliseconds: 300),
                            secondIncrementDuration:
                                const Duration(milliseconds: 100),
                            direction: Axis.horizontal,
                            dragButtonColor: Colors.blueAccent,
                            withSpring: true,
                            maxValue: 100,
                            minValue: 1,
                            withFastCount: true,
                            stepperValue: age,
                            onChanged: (val) {
                              setState(() {
                                age = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: size.width,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      Global.bmi = weight / pow(cm / 100, 2);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Center(child: Text("Your Result",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                              content: SizedBox(
                                height: size.height * 0.4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${Global.bmi.toStringAsFixed(1)}",
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${Global.getResult()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "${Global.getResultBMI()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
