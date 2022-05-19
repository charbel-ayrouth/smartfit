import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfit/models/workout_data.dart';
import 'package:smartfit/models/workouts.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //reference to the workout data collection (data taba3 user)
  final CollectionReference workoutDataCollection =
      FirebaseFirestore.instance.collection("workout-data");

  // it will run when a new account is created or when the user update his profile
  Future updateWorkoutData(
      List workoutDone, List workoutInProgress, double timeSpent) async {
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
      workoutDone: snapshot.get('workoutDone'),
      workoutInProgress: snapshot.get('workoutInProgress'),
      timeSpent: snapshot.get('timeSpent'),
    );
  }

  //get workout data from stream (taba3 specific user mn uuid taba3o)
  Stream<WorkoutData> get workoutData {
    return workoutDataCollection
        .doc(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  // hayde part ta njib kel workouts
  final CollectionReference workoutsCollection =
      FirebaseFirestore.instance.collection("workouts");

  List<Workouts> _workoutsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Workouts(
          name: doc.get('name'),
          totalMinutes: doc.get('totalMinutes'),
          exercices: doc.get('exercices'));
    }).toList();
  }

  Stream<List<Workouts>> get workouts {
    return workoutsCollection.snapshots().map(_workoutsListFromSnapshot);
  }
}
