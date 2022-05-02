import 'package:flutter/material.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout/components/training_card.dart';
import 'package:smartfit/screens/workout_progress/workout_progress.dart';
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
                      workoutName: "Treadmill",
                      imageUrl: 'assets/images/treadmill.png',
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => WorkoutProgress())));
                      },
                    ),
                    TrainingCard(
                      workoutName: "Cycling",
                      imageUrl: 'assets/images/cycling.png',
                      onPress: () {},
                    ),
                    TrainingCard(
                      workoutName: "Walking",
                      imageUrl: 'assets/images/running.png',
                      onPress: () {},
                    ),
                    TrainingCard(
                      workoutName: "Hiking",
                      imageUrl: 'assets/images/running.png',
                      onPress: () {},
                    ),
                    TrainingCard(
                      workoutName: "Yoga",
                      imageUrl: 'assets/images/yoga.png',
                      onPress: () {},
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
