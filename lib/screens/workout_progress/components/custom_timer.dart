import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workout_data.dart';

class Custom_Timer extends StatelessWidget {
  final num duration;
  final CustomTimerController controller;
  const Custom_Timer(
      {Key? key, required this.controller, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<WorkoutData?>(context);
    return CustomTimer(
        controller: controller,
        begin: Duration(minutes: duration.toInt()),
        end: Duration(),
        builder: (time) {
          return Text("${time.minutes}:${time.seconds}",
              style: const TextStyle(fontSize: 24.0));
        },
        stateBuilder: (time, state) {
          if (state == CustomTimerState.finished) {}
          // If null is returned, "builder" is displayed.
          return null;
        },
        animationBuilder: (child) {
          // You can define your own state change animations.
          // Remember to return the child widget of the builder.
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: child,
          );
        },
        onChangeState: (state) {
          // This callback function runs when the timer state changes.
          print("Current state: $state");
          print("time spnet from db ${data?.timeSpent}");
        });
  }
}
