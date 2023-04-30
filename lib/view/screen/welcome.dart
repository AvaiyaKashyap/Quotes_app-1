import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../controller/helper/QuotesGlobal.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  welcomePage() async {
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacementNamed('/');
    });
  }

  @override
  void initState() {
    super.initState();
    welcomePage();
  }

  @override
  Widget build(BuildContext context) {
    Random r1 = Random();
    int n1 = r1.nextInt(6);
    int n2 = r1.nextInt(17);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 300,
            ),
            Text(
              Global.lifeQuote[n1],
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 300,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 8)),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text(
                "ALL QUOTES",
                style: TextStyle(
                    color: Global.lifeQuoteColorBG[n2],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Global.lifeQuoteColorBG[n2],
    );
  }
}
