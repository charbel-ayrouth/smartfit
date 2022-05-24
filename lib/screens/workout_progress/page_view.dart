import 'package:flutter/material.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/workout_progress/workout_progress.dart';

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

  @override
  Widget build(BuildContext context) {
    int len = widget.exercises.length;
    return PageView(
      controller: _controller,
      children: [
        // widget.exercises.map((e,i) => WorkoutProgress(exercises: e, index: i));
        WorkoutProgress(
          exercises: widget.exercises,
          index: 0,
        ),
        WorkoutProgress(
          exercises: widget.exercises,
          index: 1,
        ),
        WorkoutProgress(
          exercises: widget.exercises,
          index: 2,
        ),
      ],
    );
  }
}
