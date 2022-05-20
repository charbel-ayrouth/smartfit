import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class TrainingCard extends StatelessWidget {
  final String workoutName;
  final String imageUrl;
  final void Function()? onPress;
  const TrainingCard(
      {Key? key,
      required this.workoutName,
      required this.imageUrl,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        elevation: 20,
        shadowColor: Colors.black,
        color: kWorkoutPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Column(
            children: [
              Image.asset(
                imageUrl,
                width: 80,
                height: 80,
              ),
              Text(
                workoutName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
