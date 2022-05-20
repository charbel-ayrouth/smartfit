import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';


class ProgressCard extends StatelessWidget {
  const ProgressCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 25,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.local_fire_department_sharp,
            size: 60.0,
            color: kPrimaryColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Keep The Progess!",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "The Pain You Feel Today, Will ",
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 68, 68, 68),
                      fontWeight: FontWeight.w200),
                ),
                Text(
                  "Be The Strength You Feel Tomorrow",
                  softWrap: false,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 68, 68, 68),
                      fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
