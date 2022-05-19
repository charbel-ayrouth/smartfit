import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout/components/training_card.dart';
import 'package:smartfit/screens/workout_progress/workout_progress.dart';
import 'package:smartfit/services/database.dart';
import 'package:smartfit/shared/background.dart';

import '../../models/workouts.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final user = Provider.of<User?>(context);

    return StreamProvider(
      create: (_) => DatabaseService(uid: user!.uid).workouts,
      initialData: null,
      child: Background(
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
                                  builder: ((context) => const WorkoutProgress(
                                      URL:
                                          'https://assets1.lottiefiles.com/packages/lf20_3ueg3po6.json',
                                      exerciseName: 'Treadmill'))));
                        },
                      ),
                      TrainingCard(
                        workoutName: "Cycling",
                        imageUrl: 'assets/images/cycling.png',
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const WorkoutProgress(
                                      URL:
                                          'https://assets10.lottiefiles.com/packages/lf20_TAs0Zd.json',
                                      exerciseName: 'Cycling'))));
                        },
                      ),
                      TrainingCard(
                        workoutName: "Hiking",
                        imageUrl: 'assets/images/hiking.png',
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const WorkoutProgress(
                                      URL:
                                          'https://assets7.lottiefiles.com/packages/lf20_bpn4s7tl.json',
                                      exerciseName: 'Hiking'))));
                        },
                      ),
                      TrainingCard(
                        workoutName: "squats",
                        imageUrl: 'assets/images/squats.png',
                        onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const WorkoutProgress(
                                      URL:
                                          'https://assets1.lottiefiles.com/packages/lf20_efL1SF.json',
                                      exerciseName: 'Squats'))));
                        },
                      ),
                      TrainingCard(
                        workoutName: "Pushups",
                        imageUrl: 'assets/images/pushups.png',
                        onPress: () {
                           Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const WorkoutProgress(
                                      URL:
                                          'https://assets4.lottiefiles.com/packages/lf20_QegQCG.json',
                                      exerciseName: 'Pushups'))));
                        },
                      ),
                      TrainingCard(
                        workoutName: "Yoga",
                        imageUrl: 'assets/images/yoga.png',
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const WorkoutProgress(
                                      URL:
                                          'https://assets3.lottiefiles.com/packages/lf20_kvwtrk4n.json',
                                      exerciseName: 'Yoga'))));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
