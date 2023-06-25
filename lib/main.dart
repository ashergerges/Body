import 'package:body/modules/HomeScreen/tab_screen.dart';
import 'package:body/splashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      //
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:MySplashScreen(),
   //   home:TabScreen(),
    );
  }
}

