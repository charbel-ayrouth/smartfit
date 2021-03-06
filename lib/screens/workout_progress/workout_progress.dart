import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/profile/components/logo.dart';
import 'package:smartfit/screens/workout_progress/components/rounded_button.dart';
import 'package:smartfit/shared/background.dart';
import 'package:smartfit/shared/constants.dart';
import 'package:intl/intl.dart';
import 'package:custom_timer/custom_timer.dart';
import '../../services/database.dart';
import 'components/custom_timer.dart';
import 'package:lottie/lottie.dart';

class WorkoutProgress extends StatefulWidget {
  final List exercises;
  final int index;
  final num oldTime;
  final String uid;
  final void Function(double number) jumpTo;
  const WorkoutProgress(
      {required this.exercises,
      required this.index,
      required this.oldTime,
      required this.jumpTo,
      required this.uid});

  @override
  State<WorkoutProgress> createState() => _WorkoutProgressState();
}

class _WorkoutProgressState extends State<WorkoutProgress> {
  final CustomTimerController _controller = CustomTimerController();
  String buttonText = "Start";
  int currentIndex = 0;
  late int currentDuration;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int len = widget.exercises.length;
    currentDuration = widget.exercises[currentIndex]['duration'];

    void handleNext() {
      setState(() {
        if (currentIndex < len - 1) {
          DatabaseService(uid: widget.uid)
              .updateExercisesDone(widget.exercises[currentIndex]);
          ++currentIndex;
          currentDuration = widget.exercises[currentIndex]['duration'];
          widget.jumpTo((currentIndex).toDouble());
        } else {
          Navigator.pop(context);
        }
      });
    }

    void handleButton(String text) {
      setState(() {
        buttonText = text;
      });
    }

    String cdate2 = DateFormat("MMMM dd").format(DateTime.now());
    final user = Provider.of<User>(context);
    return Scaffold(
      body: Background(
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
              const SizedBox(height: 20),
              Text(
                widget.exercises[currentIndex]['name'],
                style: const TextStyle(
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
                      "Date",
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
                      "Stopwatch",
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
              Custom_Timer(
                controller: _controller,
                exerciseDuration: currentDuration,
                // timeSpent: widget.workoutData!.timeSpent,
                last: currentIndex == len - 1,
                onTap: () => handleNext(),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundedButton(
                    text: buttonText,
                    color: kPrimaryColor,
                    onPressed: () => {
                      _controller.start(),
                      handleButton("Start"),
                      DatabaseService(uid: user.uid)
                          .updateTime(widget.oldTime, currentDuration)
                    },
                  ),
                  RoundedButton(
                      text: "Pause",
                      color: Colors.amber,
                      onPressed: () =>
                          {_controller.pause(), handleButton("Resume")}),
                ],
              ),
              Lottie.network(widget.exercises[currentIndex]['URL'],
                  height: 300.0, width: 300.0),
            ],
          ),
        ),
      ),
    );
  }
}
