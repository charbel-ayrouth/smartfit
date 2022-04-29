import 'package:flutter/material.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout/components/training_card.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Background(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 1),
                      Logo(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Training Activities",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 15,
                  children: [
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                    ),
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                    ),
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                    ),
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                    ),
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                    ),
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
