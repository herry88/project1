import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list![widget.index]['nmproduct']),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Card(
          elevation: 5.0,
          margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nama Produk: ${widget.list![widget.index]['nmproduct']}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
