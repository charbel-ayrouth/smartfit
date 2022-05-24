import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfit/models/workouts.dart';

class WorkoutsServices {
  final CollectionReference workoutsCollection =
      FirebaseFirestore.instance.collection("workouts");

  List<Workouts> _workoutsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Workouts(
        name: doc.get('name') ?? '',
        totalMinutes: doc.get('totalMinutes') ?? 0,
        exercices: doc.get('exercices') ??
            [
              {'URL': '', 'avergeCalories': 0, 'duration': 0, 'name': ''}
            ],
        imageName: doc.get("imageName") ?? '',
      );
    }).toList();
  }

  Stream<List<Workouts>> get workouts {
    return workoutsCollection.snapshots().map(_workoutsListFromSnapshot);
  }
}
