import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfit/models/workout_data.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //reference to the workout data collection (data taba3 user)
  final CollectionReference workoutDataCollection =
      FirebaseFirestore.instance.collection("workoutdata");

  // it will run when a new account is created or when the user update his profile
  Future updateWorkoutData(
      List exercisesDone, String lastWorkout, double timeSpent) async {
    //link the database user using his uuid to the collection
    return await workoutDataCollection.doc(uid).set({
      "exercisesDone": exercisesDone,
      "lastWorkout": lastWorkout,
      "timeSpent": timeSpent,
    });
  }

  //workout data from snapshot
  WorkoutData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return WorkoutData(
      exercisesDone: snapshot.get('exercisesDone') ?? [],
      lastWorkout: snapshot.get('lastWorkout') ?? '',
      timeSpent: snapshot.get('timeSpent') ?? 0,
    );
  }

  //get workout data from stream (taba3 specific user mn uuid taba3o)
  Stream<WorkoutData>? get workoutData {
    return workoutDataCollection
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  Future updateExercisesDone(Map exercise) async {
    var res = await workoutDataCollection.doc(uid).get();
    var exWithTime = {...exercise, 'timeStamp': DateTime.now()};
    List exDone = res.get('exercisesDone');

    exDone.add(exWithTime);
    await workoutDataCollection
        .doc(uid)
        .update({'exercisesDone': exDone}).catchError(
            (error) => print('update Failed: $error'));
  }

  // Future GetWorkouts(String type) async {
  // int len = await workoutDataCollection.doc(uid).get();
  // var res = await workoutDataCollection.doc(uid).get().;

  // ------------------------------
  void updateTime(num oldTime, num newTime) async {
    await workoutDataCollection
        .doc(uid)
        .update({"timeSpent": oldTime + newTime});
  }

  void updateLast(String workout) async {
    await workoutDataCollection
        .doc(uid)
        .update({"lastWorkout": workout})
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }
}
