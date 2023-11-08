import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quotes_app/view/screen/SplashPage.dart';
import 'package:quotes_app/view/screen/quotesCategory.dart';
import 'package:quotes_app/view/screen/quotesHomePage.dart';
import 'package:quotes_app/view/screen/welcome.dart';

void main() {
  debugRepaintRainbowEnabled:
  true;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashScreen(),
        'welcome': (context) => const WelcomePage(),
        '/': (context) => const QuotesCategory(),
        'details': (context) => const QuotesHomePage(),
      },
    );
  }
}
