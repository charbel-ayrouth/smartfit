import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfit/models/workout_data.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  //reference to the user data collection
  final CollectionReference workoutDataCollection =
      FirebaseFirestore.instance.collection("workout-data");

// it will run when a new account is created or when the user update his profile
  Future updateWorkoutData(
      int workoutDone, int workoutInProgress, double timeSpent) async {
    //link the database user using his uuid to the collection
    return await workoutDataCollection.doc(uid).set({
      "workoutDone": workoutDone,
      "workoutInProgress": workoutInProgress,
      "timeSpent": timeSpent,
    });
  }

  List<WorkoutData> _workoutDataList(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return WorkoutData(
        workoutDone: doc.get('workoutDone') ?? 0,
        workoutInProgress: doc.get('workoutInProgress') ?? 0,
        timeSpent: doc.get('timeSpent') ?? 0,
      );
    }).toList();
  }

  //get WorkoutData stream
  Stream<List<WorkoutData>> get workoutData {
    return workoutDataCollection.snapshots().map(_workoutDataList);
  }

  //user data stream
  Stream get userData {
    return workoutDataCollection.doc(uid).snapshots();
  }
}
