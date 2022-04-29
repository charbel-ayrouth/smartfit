import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class TrainingCard extends StatelessWidget {
  final String workoutName;
  final String imageUrl;
  TrainingCard({
    required this.workoutName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: Colors.black,
      color: Color(0xFFFFF0DE),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 100,
              height: 100,
            ),
            Text(
              workoutName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
