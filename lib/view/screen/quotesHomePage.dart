import 'dart:math';
import 'package:flutter/material.dart';
import '../../controller/helper/QuotesGlobal.dart';
import '../../controller/helper/quotesApiHelper.dart';
import '../../modal/quotesModal.dart';

class QuotesHomePage extends StatefulWidget {
  const QuotesHomePage({Key? key}) : super(key: key);

  @override
  State<QuotesHomePage> createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends State<QuotesHomePage> {
  // Random random = Random();
  // int i = 0;
  // changeIndex() {
  //   setState(() => i = random.nextInt(3));
  // }
  List<Color> bgColors = [
    Colors.white,
    Colors.red.shade200,
    Colors.pink.shade200,
    Colors.purple.shade200,
    Colors.deepPurple.shade200,
    Colors.indigo.shade200,
    Colors.blue.shade200,
    Colors.lightBlue.shade200,
    Colors.cyan.shade200,
    Colors.teal.shade200,
    Colors.green.shade200,
    Colors.lightGreen.shade200,
    Colors.lime.shade200,
    Colors.yellow.shade200,
    Colors.amber.shade200,
    Colors.orange.shade200,
    Colors.deepOrange.shade200,
    Colors.brown.shade200,
  ];

  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    Random r1 = Random();
    int n1 = r1.nextInt(18);
    int n2 = r1.nextInt(18);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(data),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder(
            future: QuotesApiHelper.quotesApiHelper.fetchData(),
            builder: (context, snp) {
              if (snp.hasError) {
                return Center(
                  child: Text("ERROR:- ${snp.error}"),
                );
              } else if (snp.hasData) {
                // print('${snp.data}');
                List<Quotes>? data = snp.data;
                return (data != null)
                    ? ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              Container(
                                height: 450,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("${Global.bGImage[n2]}"),
                                      fit: BoxFit.cover),
                                  // border: Border.all(
                                  //   width: 3,
                                  //   // color: Colors.black,
                                  // ),
                                  // color: Colors.black,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Center(
                                    child: Text(
                                      data[i].quote,
                                      style: TextStyle(
                                          color: bgColors[n1],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 3,
                                    color: Colors.white,
                                  ),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black, blurRadius: 10,
                                      // blurRadius: 10,
                                    )
                                  ],
                                  borderRadius: const BorderRadius.vertical(
                                      bottom: Radius.circular(20)),
                                ),
                                child: Row(
                                  children: [
                                    OutlinedButton.icon(
                                      onPressed: () {},
                                      label: const Text(
                                        "Share",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      icon: const Icon(
                                        Icons.share_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      label: const Text(
                                        "Color",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      icon: const Icon(
                                        Icons.color_lens_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                    OutlinedButton.icon(
                                        onPressed: () {},
                                        label: const Text(
                                          "Like",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        icon: (isFav == false)
                                            ? const Icon(
                                                Icons.favorite_border,
                                                color: Colors.black,
                                                size: 20,
                                              )
                                            : Icon(
                                                Icons.favorite,
                                                color: Colors.pink.shade900,
                                              )),
                                    OutlinedButton.icon(
                                      onPressed: () {
                                        setState(() {});
                                      },
                                      label: const Text(
                                        "BG",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      icon: const Icon(
                                        Icons.image_outlined,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    border: Border.all(
                                        width: 2, color: Colors.black)),
                              ),
                              Text("author: ${data[i].author}"),
                              Text("Category: ${data[i].category}"),
                            ],
                          );
                        })
                    : const Center(
                        child: Text(
                          "NO DATA",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.cyan,
                    color: Colors.cyan.shade900,
                  ),
                );
              }
            }),
      ),
    );
  }
}
