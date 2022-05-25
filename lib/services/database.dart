import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfit/models/workout_data.dart';
import 'package:smartfit/models/workouts.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //reference to the workout data collection (data taba3 user)
  final CollectionReference workoutDataCollection =
      FirebaseFirestore.instance.collection("workoutdata");

  // it will run when a new account is created or when the user update his profile
  Future updateWorkoutData(
      List workoutDone, String workoutInProgress, double timeSpent) async {
    //link the database user using his uuid to the collection
    return await workoutDataCollection.doc(uid).set({
      "workoutDone": workoutDone,
      "workoutInProgress": workoutInProgress,
      "timeSpent": timeSpent,
    });
  }

  //workout data from snapshot
  WorkoutData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return WorkoutData(
      workoutDone: snapshot.get('workoutDone') ?? [],
      workoutInProgress: snapshot.get('workoutInProgress') ?? '',
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

  // ------------------------------
  void updateTime(num oldTime, num newTime) async {
    await workoutDataCollection
        .doc(uid)
        .update({"timeSpent": oldTime + newTime});
  }

  void updateProgress(String workout) async {
    await workoutDataCollection
        .doc(uid)
        .update({"workoutInProgress": workout})
        .then((_) => print('Added'))
        .catchError((error) => print('Add failed: $error'));
  }

  // void updateTime(num oldTime, int currentDuration) async {
  //   await workoutDataCollection.doc(uid).
  // }
  //--------------------

}
