import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../controller/helper/QuotesGlobal.dart';
import '../../controller/helper/quotesApiHelper.dart';
import '../../modal/quotesModal.dart';

class QuotesHomePage extends StatefulWidget {
  const QuotesHomePage({Key? key}) : super(key: key);

  @override
  State<QuotesHomePage> createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends State<QuotesHomePage> {
  bool isFav = false;
  static GlobalKey previewContainer = GlobalKey();
  dynamic myImage = 'assets/image/bg18.jpg';
  GlobalKey imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String data = ModalRoute.of(context)!.settings.arguments as String;
    Random r1 = Random();
    int n1 = r1.nextInt(18);
    int n2 = r1.nextInt(18);
    return RepaintBoundary(
      key: previewContainer,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(data),
          backgroundColor: Colors.grey.shade100,
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
                                RepaintBoundary(
                                  key: imageKey,
                                  child: Container(
                                    height: 450,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("$myImage"),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular((20)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Center(
                                        child: Text(
                                          data[i].quote,
                                          style: TextStyle(
                                              color: myColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 130,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        RenderRepaintBoundary boundary =
                                            imageKey.currentContext!
                                                    .findRenderObject()
                                                as RenderRepaintBoundary;
                                        var img = await boundary.toImage(
                                          pixelRatio: 5,
                                        );
                                        var bit = await img.toByteData(
                                            format: ImageByteFormat.png);
                                        var uList = bit!.buffer.asUint8List();

                                        if (uList != null) {
                                          Directory dir =
                                              await getApplicationDocumentsDirectory();

                                          DateTime d = DateTime.now();
                                          File file = await File(
                                                  "${dir.path}/FA${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}.png")
                                              .create();
                                          await file.writeAsBytes(uList);

                                          Share.shareXFiles([XFile(file.path)]);
                                        }
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  // color: Colors.black, blurRadius: 5,
                                                  // blurRadius: 10,
                                                  )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Icon(
                                              Icons.share_outlined,
                                              color: Colors.red.shade200,
                                              size: 20,
                                            ),
                                            const Text(
                                              "Share",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global.myColor
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myColor =
                                                                          e['colors'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 14,
                                                                    backgroundColor:
                                                                        e['colors'],
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myColor2
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myColor =
                                                                          e['colors'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 14,
                                                                    backgroundColor:
                                                                        e['colors'],
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myColor3
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myColor =
                                                                          e['colors'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 14,
                                                                    backgroundColor:
                                                                        e['colors'],
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myColor4
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myColor =
                                                                          e['colors'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      CircleAvatar(
                                                                    radius: 14,
                                                                    backgroundColor:
                                                                        e['colors'],
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                    ]),
                                              );
                                            });
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  // color: Colors.black, blurRadius: 3,
                                                  // blurRadius: 10,
                                                  )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Icon(
                                              Icons.color_lens_outlined,
                                              color: Colors.red.shade200,
                                              size: 20,
                                            ),
                                            const Text(
                                              "Color",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global.myImage
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myImage =
                                                                          e['image'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                      e['image'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myImage1
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myImage =
                                                                          e['image'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                      e['image'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myImage2
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myImage =
                                                                          e['image'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                      e['image'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myImage3
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myImage =
                                                                          e['image'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                      e['image'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: Global
                                                            .myImage4
                                                            .map((e) =>
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      myImage =
                                                                          e['image'];
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 50,
                                                                    width: 50,
                                                                    child: Image
                                                                        .asset(
                                                                      e['image'],
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                      ),
                                                    ]),
                                              );
                                            });
                                      },
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                  // color: Colors.black, blurRadius: 5,
                                                  // blurRadius: 10,
                                                  )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Icon(
                                              Icons.image_outlined,
                                              color: Colors.red.shade200,
                                              size: 20,
                                            ),
                                            const Text(
                                              "BG",
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Container(
                                //   height: 50,
                                //   width: 50,
                                //   decoration: BoxDecoration(
                                //       color: Colors.pink,
                                //       border: Border.all(
                                //           width: 2, color: Colors.black)),
                                // ),
                                // Text("author: ${data[i].author}"),
                                // Text("Category: ${data[i].category}"),
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
        backgroundColor: Colors.grey.shade100,
      ),
    );
  }
}

dynamic myColor = Colors.white;
