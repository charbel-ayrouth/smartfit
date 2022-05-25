import 'package:flutter/material.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/workout_progress/page_view.dart';
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
                      title: Text("${workout.exercices[index]['name']}"),
                      subtitle: Text(
                          "duration: ${workout.exercices[index]['duration']}, average calories burned: ${workout.exercices[index]['averageCalories']}"),
                    ),
                  );
                }
                return TextButton(
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageViewHolder(exercises: workout.exercices),
                          ),
                        ),
                    child: const Text("Start Workout"));
              }),
        ),
      ),
    );
  }
}
