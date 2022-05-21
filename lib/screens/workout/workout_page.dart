import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout_progress/workout_progress.dart';
import 'package:smartfit/services/workouts_services.dart';
import 'package:smartfit/shared/background.dart';

import 'components/training_card.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final user = Provider.of<User?>(context);

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
                StreamBuilder<List<Workouts>>(
                    stream: WorkoutsServices().workouts,
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("There is no workouts");
                      } else {
                        return Wrap(
                            spacing: 20,
                            runSpacing: 15,
                            children: snapshot.data!
                                .map((e) => (TrainingCard(
                                      workoutName: e.name,
                                      imageUrl: 'assets/images/${e.imageName}',
                                      onPress: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                const WorkoutProgress(
                                                    URL:
                                                        'https://assets1.lottiefiles.com/packages/lf20_3ueg3po6.json',
                                                    exerciseName: 'Treadmill')),
                                          ),
                                        );
                                      },
                                    )))
                                .toList());
                      }
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
