import 'package:flutter/material.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';

import 'components/exercise_card.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const SizedBox(), Logo()],
            ),
            const Text(
              "Helo, User !",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("Track Your Progress",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 40),
            const Text("Recent exercises",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExerciseCard(
                  ImageUrl: 'assets/images/arms.png',
                ),
                ExerciseCard(
                  ImageUrl: 'assets/images/cardio.png',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Daily"),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: kPrimaryColor,
                    elevation: 10,
                    shadowColor: kPrimaryColor,
                    onSurface: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Weekly",
                    style: TextStyle(color: Color(0xFFCBCBCB)),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Monthly",
                    style: TextStyle(color: Color(0xFFCBCBCB)),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Yearly",
                    style: TextStyle(color: Color(0xFFCBCBCB)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
