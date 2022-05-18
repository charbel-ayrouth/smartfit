import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/screens/home/components/InProgress_card.dart';
import 'package:smartfit/screens/home/components/home_card.dart';
import 'package:smartfit/screens/home/components/progress_card.dart';
import 'package:smartfit/screens/home/components/time_card.dart';
import 'package:smartfit/services/database.dart';
import '../../shared/background.dart';
import '../profile/components/logo.dart';
import 'components/finished_card.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
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

  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    return StreamProvider(
      create: (_) => DatabaseService(uid: user!.uid).workoutData,
      initialData: null,
      child: Background(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [const SizedBox(), Logo()],
            ),
            const SizedBox(height: 10),
            if (user?.displayName == null)
              const Text("Hello User")
            else
              Text(
                "Hello " + user!.displayName.toString() + ",",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    suffixIcon:
                        IconButton(onPressed: null, icon: Icon(Icons.search))),
              ),
              margin: const EdgeInsets.only(top: 20, bottom: 30),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        spreadRadius: 2,
                        blurRadius: 15,
                        offset: const Offset(0, 0))
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FinishedCard(),
                Column(
                  children: const [
                    InProgressCard(),
                    TimeCard(),
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
              children: const [
                HomeCard(
                  ImageUrl: 'assets/images/arms.png',
                ),
                HomeCard(
                  ImageUrl: 'assets/images/cardio.png',
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const ProgressCard(),
          ]),
        ),
      )),
    );
  }
}
