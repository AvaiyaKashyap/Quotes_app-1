import 'package:flutter/material.dart';
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
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search)),
                ),
              )),
          Expanded(
            flex: 21,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: Global.categoryS
                    .map((e) => Container(
                        margin: const EdgeInsets.all(5),
                        color: e['color'],
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "${e['category']}",
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
                        )))
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
