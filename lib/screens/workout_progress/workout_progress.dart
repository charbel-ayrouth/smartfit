import 'package:flutter/material.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:intl/intl.dart';

class WorkoutProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String cdate2 = DateFormat("MMMM dd").format(DateTime.now());
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: kPrimaryColor,
                      ),
                    ),
                    Logo(),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                "Treadmill",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Schedule",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(text: cdate2),
                          const WidgetSpan(
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.calendar_month,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
