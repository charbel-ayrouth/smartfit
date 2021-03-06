import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/models/workout_data.dart';
import 'package:smartfit/models/workouts.dart';
import 'package:smartfit/screens/home/components/InProgress_card.dart';
import 'package:smartfit/screens/home/components/home_card.dart';
import 'package:smartfit/screens/home/components/progress_card.dart';
import 'package:smartfit/screens/home/components/time_card.dart';
import 'package:smartfit/services/database.dart';
import 'package:smartfit/shared/loading.dart';
import '../../shared/background.dart';
import '../profile/components/logo.dart';
import 'components/finished_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int toggle = 1;

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final workouts = Provider.of<List<Workouts>?>(context);
    final personalData = Provider.of<WorkoutData?>(context);
    return StreamBuilder<WorkoutData>(
        stream: DatabaseService(uid: user!.uid).workoutData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WorkoutData? personalData = snapshot.data;
            return Background(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [const SizedBox(), Logo()],
                        ),
                        const SizedBox(height: 10),
                        if (user.displayName == null)
                          const Text("Hello User")
                        else
                          Text(
                            "Hello " + user.displayName.toString() + ",",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FinishedCard(
                              num: personalData!.exercisesDone.length,
                            ),
                            Column(
                              children: [
                                InProgressCard(name: personalData.lastWorkout),
                                TimeCard(
                                  time: personalData.timeSpent,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text("Discover New Workouts",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            )),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeCard(
                              imageUrl:
                                  'assets/images/${workouts![workouts.length - 2].imageName}',
                              exercices: workouts[workouts.length - 2]
                                  .exercices
                                  .length,
                              minutes:
                                  workouts[workouts.length - 2].totalMinutes,
                              name: workouts[workouts.length - 2].name,
                            ),
                            HomeCard(
                              imageUrl:
                                  'assets/images/${workouts[workouts.length - 1].imageName}',
                              exercices: workouts[workouts.length - 1]
                                  .exercices
                                  .length,
                              minutes:
                                  workouts[workouts.length - 1].totalMinutes,
                              name: workouts[workouts.length - 1].name,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const ProgressCard(),
                      ]),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
