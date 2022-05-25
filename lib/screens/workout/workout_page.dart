import 'package:flutter/material.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout_exercices/workout_exercices_page.dart';
import 'package:smartfit/services/workouts_services.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/loading.dart';
import 'components/training_card.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
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
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Text("Error");
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Loading();
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
                                              WorkoutExercices(workout: e)),
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
    );
  }
}
