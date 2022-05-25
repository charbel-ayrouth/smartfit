import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartfit/screens/wrapper.dart';
import 'package:smartfit/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(create: (_) => AuthService().user, initialData: null),
        StreamProvider(
            create: (_) => AuthService().userData, initialData: null),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
        ),
        // anything inside Wrapper widget can access the data provided by the StreamProvider
        home: const Wrapper(),
      ),
    );
  }
}
