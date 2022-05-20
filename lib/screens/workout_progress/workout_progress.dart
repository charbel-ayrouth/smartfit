import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout_progress/components/rounded_button.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:intl/intl.dart';
import 'package:custom_timer/custom_timer.dart';
import '../../models/workouts.dart';
import '../../services/database.dart';
import 'components/custom_timer.dart';
import 'package:lottie/lottie.dart';

class WorkoutProgress extends StatelessWidget {
  final String URL;
  final String exerciseName;
  const WorkoutProgress({required this.URL, required this.exerciseName});

  @override
  Widget build(BuildContext context) {
    String cdate2 = DateFormat("MMMM dd").format(DateTime.now());
    final CustomTimerController _controller = CustomTimerController();
    final user = Provider.of<User?>(context);
    var dataRef = DatabaseService(uid: user!.uid);
    // final workouts = Provider.of<Workouts>(context);
    return Scaffold(
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
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
                Text(
                  exerciseName,
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18.0),
                  child: Row(
                    children: const [
                      Text(
                        "Your Progress",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.timer_outlined,
                        size: 24.0,
                        color: kPrimaryColor,
                      )
                    ],
                  ),
                ),
                Custom_Timer(controller: _controller),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedButton(
                      text: "Start",
                      color: kPrimaryColor,
                      onPressed: () =>
                          {dataRef.updateTime(), _controller.start()},
                    ),
                    RoundedButton(
                      text: "Pause",
                      color: Colors.amber,
                      onPressed: () => _controller.pause(),
                    ),
                    RoundedButton(
                      text: "Reset",
                      color: kPrimaryColor,
                      onPressed: () => _controller.reset(),
                    )
                  ],
                ),
                Lottie.network(URL, height: 300.0, width: 300.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
