import 'package:flutter/material.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/workout_progress/page_view.dart';
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
              itemCount: workout.exercices.length + 1,
              itemBuilder: (BuildContext context, int index) {
                // checking if the index item is the last item of the list or not
                if (index < workout.exercices.length) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        "${workout.exercices[index]['name']}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "duration: ${workout.exercices[index]['duration']}, average calories burned: ${workout.exercices[index]['averageCalories']}",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PageViewHolder(exercises: workout.exercices),
                        // WorkoutProgress(exercises: workout.exercices),
                      ),
                    ),
                    child: const Text("Start Workout"),
                    style: ElevatedButton.styleFrom(
                      primary: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      textStyle: const TextStyle(fontSize: 25),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
