// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartfit/screens/wrapper.dart';
import 'package:smartfit/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:smartfit/shared/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value: AuthService().user, // we are listening to the Stream user
      initialData: null,
      catchError: (_, __) {},

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        // anything inside Wrapper widget can access the data provided by the StreamProvider
        home: Wrapper(),
      ),
    );
  }
}
