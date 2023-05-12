import 'package:flutter/material.dart';
import 'package:quotes_app/view/screen/quotesHomePage.dart';
import '../../controller/helper/QuotesGlobal.dart';

class QuotesCategory extends StatefulWidget {
  const QuotesCategory({Key? key}) : super(key: key);

  @override
  State<QuotesCategory> createState() => _QuotesCategoryState();
}

class _QuotesCategoryState extends State<QuotesCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Best Quotes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        // actions: [IconButton(onPressed: (){}, icon: Icon(Icons.p))],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: Global.categoryS
                    .map((e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              Global.endpoint = e['category'];
                            });
                            Navigator.of(context)
                                .pushNamed('details', arguments: e['category']);
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const QuotesHomePage(),));
                          },
                          child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: e['color'],
                              ),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "${e['category']}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Image.asset(
                                        '${e['image']}',
                                        height: 100,
                                        width: 100,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              )),
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
      // body: Center(
      //     child: Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             Global.endpoint = "age";
      //           });
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => QuotesHomePage()));
      //         },
      //         child: Text("age")),
      //     ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             Global.endpoint = "alone";
      //           });
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => QuotesHomePage()));
      //         },
      //         child: Text("alone")),
      //     ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             Global.endpoint = "amazing";
      //           });
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => QuotesHomePage()));
      //         },
      //         child: Text("amazing")),
      //     ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             Global.endpoint = "anger";
      //           });
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => QuotesHomePage()));
      //         },
      //         child: Text("anger")),
      //     ElevatedButton(
      //         onPressed: () {
      //           setState(() {
      //             Global.endpoint = "art";
      //           });
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => QuotesHomePage()));
      //         },
      //         child: Text("art")),
      //   ],
      // )),
    );
  }
}
