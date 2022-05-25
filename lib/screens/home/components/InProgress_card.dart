import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class InProgressCard extends StatelessWidget {
  final String name;
  const InProgressCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  "In Progress",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 2.0),
                Icon(
                  Icons.percent_outlined,
                  size: 22.0,
                  color: kPrimaryColor,
                ),
              ],
            ),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                color: kPrimaryColor,
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
