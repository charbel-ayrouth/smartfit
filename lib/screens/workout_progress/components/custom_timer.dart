import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';


class Custom_Timer extends StatelessWidget {
  const Custom_Timer({
    Key? key,
    required CustomTimerController controller,
  }) : _controller = controller, super(key: key);

  final CustomTimerController _controller;

  @override
  Widget build(BuildContext context) {
    return CustomTimer(
        controller: _controller,
        begin: Duration(),
        end: Duration(minutes: 15),
        builder: (time) {
          return Text(
              "${time.hours}:${time.minutes}:${time.seconds}.${time.milliseconds}",
              style: TextStyle(fontSize: 24.0));
        },
        stateBuilder: (time, state) {
          // This builder is shown when the state is different from "couting".
          if (state == CustomTimerState.paused)
            return Text("The timer is paused",
                style: TextStyle(fontSize: 24.0));

          // If null is returned, "builder" is displayed.
          return null;
        },
        animationBuilder: (child) {
          // You can define your own state change animations.
          // Remember to return the child widget of the builder.
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 250),
            child: child,
          );
        },
        onChangeState: (state) {
          // This callback function runs when the timer state changes.
          print("Current state: $state");
        });
  }
}