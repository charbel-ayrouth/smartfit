import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workout_data.dart';
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
    return PageView.builder(
      controller: _controller,
      itemCount: len,
      itemBuilder: (BuildContext context, int index) {
        return WorkoutProgress(
          exercises: widget.exercises,
          index: index,
        );
      },
    );
  }
}
