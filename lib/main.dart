import 'package:flutter/material.dart';
import 'package:quotes_app/view/screen/quotesCategory.dart';
import 'package:quotes_app/view/screen/quotesHomePage.dart';

void main() {
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
      routes: {
        '/': (context) => const QuotesCategory(),
        'details': (context) => const QuotesHomePage(),
      },
    );
  }
}
