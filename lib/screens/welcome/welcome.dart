import 'package:flutter/material.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';

class Welcome extends StatelessWidget {
  final Function toggleView;
  const Welcome({Key? key, required this.toggleView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 35),
              child: Row(
                children: [
                  const SizedBox(
                    width: 5.0,
                  ),
                  Logo()
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Text(
                "WELCOME",
                style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              color: Colors.black,
              child: Image.asset("assets/images/illustration1.jpeg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "Your "),
                        TextSpan(
                            text: "Fitness, Wellness & Lifestyle",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: " activities in a single platform."),
                      ])),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: ElevatedButton(
                onPressed: () {
                  toggleView('Login');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Get Started',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
