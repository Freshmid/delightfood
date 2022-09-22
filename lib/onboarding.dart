import 'package:flutter/material.dart';
import 'home2.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          OnboardingScreen()
                                                         )
                                       )
         );
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
  void goHome() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
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
        child: Column(
          children: [
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
              'You will win your enemy if you give them foods.\n- Sun Tzu',
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

            ClipRRect(
              borderRadius: BorderRadius.circular(26.5),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFFE7872C),
                            Color(0xFFff9934),
                            Color(0xFFFDAF61),
                          ],
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      goHome();
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(26.5),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFFD0D0D0),
                            Color(0xFFD0D0D0),
                          ],
                        ),
                      ),
                    ),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: const Size(300, 50),
                      foregroundColor: Colors.black54,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      goHome();
                    },
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
