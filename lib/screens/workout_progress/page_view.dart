import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workout_data.dart';
import 'package:smartfit/screens/workout_progress/workout_progress.dart';
import 'package:smartfit/services/database.dart';
import 'package:smartfit/shared/loading.dart';

class PageViewHolder extends StatefulWidget {
  final List exercises;
  const PageViewHolder({Key? key, required this.exercises}) : super(key: key);

  @override
  State<PageViewHolder> createState() => _PageViewHolderState();
}

class _PageViewHolderState extends State<PageViewHolder> {
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextPage(double number) {
    _controller.jumpTo(number);
  }

  @override
  Widget build(BuildContext context) {
    int len = widget.exercises.length;
    final user = Provider.of<User>(context);
    return PageView.builder(
      controller: _controller,
      itemCount: len,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return StreamBuilder<WorkoutData>(
            stream: DatabaseService(uid: user.uid).workoutData,
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return const Text("Error");
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Loading();
              } else {
                var data = snapshot.data;
                return WorkoutProgress(
                    exercises: widget.exercises,
                    index: index,
                    oldTime: data!.timeSpent,
                    jumpTo: (number) => nextPage(number),
                    uid: user.uid);
              }
            }));
      },
    );
  }
}
