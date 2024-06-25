import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_marketplace/screens/home_screen.dart';
import 'package:my_marketplace/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      });
    });

    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 100),
      ),
    );
  }
}
