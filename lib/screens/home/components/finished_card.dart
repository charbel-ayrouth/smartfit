import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class FinishedCard extends StatelessWidget {
  final int num;
  const FinishedCard({
    Key? key,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final data = Provider.of<WorkoutData>(context);
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 21.5,
              ),
              child: Text(
                num.toString(),
                style: const TextStyle(
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
              "Exercises",
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
