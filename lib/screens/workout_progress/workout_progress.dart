import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workout_data.dart';
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
  const WorkoutProgress({required this.exercises, required this.index});

  @override
  State<WorkoutProgress> createState() => _WorkoutProgressState();
}

class _WorkoutProgressState extends State<WorkoutProgress> {
  final CustomTimerController _controller = CustomTimerController();
  String buttonText = "Start";

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  void handleButton(String text) {
    setState(() {
      buttonText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    String cdate2 = DateFormat("MMMM dd").format(DateTime.now());

    final user = Provider.of<User?>(context);
    DatabaseService dataRef = DatabaseService(uid: user!.uid);

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
                widget.exercises[widget.index]['name'],
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
                duration: widget.exercises[widget.index]['duration'],
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
                      print("start ${_controller.state}"),
                      handleButton("Start")
                    },
                  ),
                  RoundedButton(
                      text: "Pause",
                      color: Colors.amber,
                      onPressed: () => {
                            _controller.pause(),
                            print("Pause ${_controller.state}"),
                            handleButton("Resume")
                          }),
                ],
              ),
              Lottie.network(widget.exercises[widget.index]['URL'],
                  height: 300.0, width: 300.0),
            ],
          ),
        ),
      ),
    );
  }
}
