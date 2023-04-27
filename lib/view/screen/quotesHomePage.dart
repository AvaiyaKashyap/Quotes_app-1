import 'package:flutter/material.dart';

import '../../controller/helper/quotesApiHelper.dart';
import '../../modal/quotesModal.dart';

class QuotesHomePage extends StatefulWidget {
  const QuotesHomePage({Key? key}) : super(key: key);

  @override
  State<QuotesHomePage> createState() => _QuotesHomePageState();
}

class _QuotesHomePageState extends State<QuotesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: QuotesApiHelper.quotesApiHelper.fetchData(),
          builder: (context, snp) {
            if (snp.hasError) {
              print("${snp.error}");
              return Center(
                child: Text("ERROR:- ${snp.error}"),
              );
            } else if (snp.hasData) {
              print('${snp.data}');
              List<Quotes>? data = snp.data;
              return (data != null)
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Padding(padding: EdgeInsets.all(10)),
                            Text("quote: ${data[i].quote}"),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("author: ${data[i].author}"),
                            Padding(padding: EdgeInsets.all(10)),
                            Text("Category: ${data[i].category}"),
                          ],
                        );
                      })
                  : const Center(
                      child: Text("NO DATA"),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
