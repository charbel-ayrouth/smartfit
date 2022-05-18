import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workout_data.dart';
import 'package:smartfit/shared/constants.dart';

class FinishedCard extends StatelessWidget {
  const FinishedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final workoutdata = Provider.of<WorkoutData>(context);
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  "Finished",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  Icons.check_circle_outline,
                  size: 22.0,
                  color: kPrimaryColor,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 21.5,
              ),
              child: Text(
                "12",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const Text(
              "Completed",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            const Text(
              "Workouts",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.0,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
