import 'package:dietfast/screens/ask.dart';
import 'package:dietfast/screens/details.dart';
import 'package:dietfast/screens/home.dart';
import 'package:dietfast/screens/onboarding.dart';
import 'package:dietfast/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var myapp;
  print("Initializing.");
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _preference = await SharedPreferences.getInstance();
  var firstRun = _preference.getBool("isNotFirstRun");
  print("Isn't First Run Status: $firstRun");
  if (firstRun == null) {
    myapp = MaterialApp(
      title: 'Diet Fast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: DetailsPage(),
      initialRoute: '/onboarding',
      routes: {
        '/home': (context) => HomeScreen(),
        '/ask': (context) => AskPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/details': (context) => DetailsPage(),
        '/': (context) => LoginPage(),
      },
    );
  } else {
    myapp = MaterialApp(
      title: 'Diet Fast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: DetailsPage(),
      initialRoute: '/',
      routes: {
        '/home': (context) => HomeScreen(),
        '/ask': (context) => AskPage(),
        '/details': (context) => DetailsPage(),
        '/': (context) => LoginPage(),
      },
    );
  }
  runApp(myapp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: DetailsPage(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/ask': (context) => AskPage(),
        '/onboarding': (context) => OnboardingPage(),
        '/details': (context) => DetailsPage(),
        '/': (context) => LoginPage(),
      },
    );
  }
}
