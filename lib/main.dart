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
    return MultiProvider(
      providers: [
        StreamProvider(create: (_) => AuthService().user, initialData: null),
        StreamProvider(create: (_) => AuthService().userData, initialData: null)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        // anything inside Wrapper widget can access the data provided by the StreamProvider
        home: Wrapper(),
      ),
    );
  }
}
