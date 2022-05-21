// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/services/auth.dart';
import 'package:smartfit/services/workouts_services.dart';
import 'package:smartfit/shared/constants.dart';
import 'analysis/analysis_page.dart';
import 'profile/profile_page.dart';
import 'home/home_page.dart';
import 'workout/workout_page.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int currentIndex = 0;
  final screens = <Widget>[
    HomePage(),
    WorkoutPage(),
    AnalysisPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (_) => WorkoutsServices().workouts,
      initialData: null,
      child: Scaffold(
        // to keep the widget alive not destroyed when we switch to another page
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: kPrimaryColor,
          iconSize: 30,
          // selectedFontSize: 16,
          // unselectedFontSize: 14,
          unselectedItemColor: Colors.grey,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: 'Workouts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined),
              label: 'Analysis',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
