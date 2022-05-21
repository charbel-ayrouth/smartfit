import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String ImageUrl;
  final int exercices;
  final num minutes;
  const HomeCard(
      {Key? key,
      required this.ImageUrl,
      required this.exercices,
      required this.minutes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: const Color.fromARGB(255, 212, 212, 212),
      color: Colors.orangeAccent[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Cardio",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  Text("$exercices exercises",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                  Text("$minutes Minutes",
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Image.asset(
              ImageUrl,
              height: 80,
              width: 95.0,
            ),
          ],
        ),
      ),
    );
  }
}
