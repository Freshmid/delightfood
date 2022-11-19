import 'package:delightfood/base_app/base.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'login.dart';

import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    var pref;
    SharedPreferences.getInstance().then((value) => pref = value);
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => pref.getInt("user_id") == null
                    ? OnboardingScreen()
                    : BaseApp())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // child:FlutterLogo(size:MediaQuery.of(context).size.height)
      child: const Image(image: AssetImage("assets/logos/logo_nobg.png")),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void goSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUp(),
      ),
    );
  }

  void goLogin() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.5),
        child: ListView(scrollDirection: Axis.vertical, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Container(
            height: 213,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logos/logo_nobg.png"),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          const Text(
            'Welcome to Delightfood',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Color(0xFF0E0E2D),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Text(
            "You will win your enemy if you know how to win their food recipes.\n- Sun Tzu",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff9A9DB0),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          ElevatedButton(
              style: TextButton.styleFrom(
                elevation: 5,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color(0xFFff9934),
              ),
              onPressed: () {
                goSignUp();
              },
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: TextButton.styleFrom(
                elevation: 5,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Color.fromARGB(255, 206, 206, 206),
              ),
              onPressed: () {
                goLogin();
              },
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
        ]),
      ),
    );
  }
}
