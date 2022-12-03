import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'onboarding/onboarding.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await dotenv.load(fileName: ".env");
  // run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delightfood',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: Splash(),
    );
  }
}
