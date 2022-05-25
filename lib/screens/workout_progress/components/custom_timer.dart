import 'package:custom_timer/custom_timer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/workout_progress/components/rounded_button.dart';

class Custom_Timer extends StatelessWidget {
  final num exerciseDuration;
  final num? timeSpent;
  final bool? last;
  final CustomTimerController controller;
  final void Function() onTap;

  const Custom_Timer({
    Key? key,
    required this.controller,
    required this.exerciseDuration,
    this.timeSpent,
    this.last,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Duration intToTimeLeft(int value) {
      int h, m, s;
      h = value ~/ 3600;
      m = ((value - h * 3600)) ~/ 60;
      s = value - (h * 3600) - (m * 60);
      return Duration(hours: h, minutes: h, seconds: s);
    }

    Future<void> playSound() async {
      AudioPlayer player = AudioPlayer();
      var sound = await player.setAsset('assets/Done.mp3');
      var result = player.play();
    }

    return CustomTimer(
        controller: controller,
        begin: Duration(seconds: exerciseDuration.toInt()),
        end: const Duration(),
        builder: (time) {
          return Text("${time.minutes}:${time.seconds}",
              style: const TextStyle(fontSize: 24.0));
        },
        stateBuilder: (time, state) {
          if (state == CustomTimerState.finished) {
            // playSound();
            // DatabaseService(uid: user.uid)
            //     .updateTime(timeSpent, exerciseDuration);
            return RoundedButton(
              text: last != true ? "Next Exercises" : "End",
              color: Colors.green,
              onPressed: () => {
                controller.reset(),
                onTap(),
              },
            );
          }
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
          // print("Current state: $state");
          // print("time spent from db $timeSpent");
        });
  }
}
