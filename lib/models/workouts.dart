class Workouts {
  final String name;
  final num totalMinutes;
  final List exercices;
  final String imageName;
  final bool? finished;
  Workouts({
    required this.name,
    required this.totalMinutes,
    required this.exercices,
    required this.imageName,
    this.finished,
  });
}
