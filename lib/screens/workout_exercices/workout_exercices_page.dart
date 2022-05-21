import 'package:flutter/material.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/workout_progress/workout_progress.dart';
import 'package:smartfit/shared/constants.dart';

class WorkoutExercices extends StatelessWidget {
  final Workouts workout;
  const WorkoutExercices({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGrey,
        foregroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: ListView.builder(
            itemCount: workout.exercices.length,
            itemBuilder: (BuildContext context, int index) {
              // return Text('exercice ${workout.exercices[index]}');
              // List info = workout.exercices[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutProgress(
                        URL:
                            "https://assets1.lottiefiles.com/packages/lf20_3ueg3po6.json",
                        exerciseName: workout.exercices[index]['name']),
                  ),
                ),
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text("${workout.exercices[index]['name']}"),
                    subtitle: Text(
                        "duration: ${workout.exercices[index]['duration']}, average calories burned: ${workout.exercices[index]['averageCalories']}"),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
