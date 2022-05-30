import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class TimeCard extends StatelessWidget {
  final num time;
  const TimeCard({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration intToTimeLeft(int value) {
      int h, m, s;
      h = value ~/ 3600;
      m = ((value - h * 3600)) ~/ 60;
      s = value - (h * 3600) - (m * 60);
      return Duration(hours: h, minutes: h, seconds: s);
    }

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
                  "Time Spent",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 2.0),
                Icon(
                  Icons.timer_outlined,
                  size: 22.0,
                  color: kPrimaryColor,
                ),
              ],
            ),
            Text(
              intToTimeLeft(time.toInt()).toString().split('.')[0],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                color: kPrimaryColor,
              ),
            ),
            // const Text(
            //   "Minutes",
            //   style: TextStyle(
            //     fontWeight: FontWeight.w500,
            //     fontSize: 12.0,
            //     color: Colors.grey,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
