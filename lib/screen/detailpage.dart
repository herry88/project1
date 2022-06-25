import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project1/helper/databasehelper.dart';
import 'package:project1/screen/tabberpage.dart';

import 'editpage.dart';

class DetailPage extends StatefulWidget {
  List? list;
  int index;
  DetailPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //function deelte
  DBHelper dbHelper = DBHelper();

  void confirm(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Do you want to delete this item?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    //funcgtion deelte
                    dbHelper.deleteData(widget.list![widget.index]['id']);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TabberPage(),
                      ),
                    );
                  },
                  child: const Text('Yes'),
                ),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                  style: GoogleFonts.pacifico(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        //edit function nanti
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditPage(),
                          ),
                        );
                      },
                      child: const Text('Edit'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        confirm(context);
                      },
                      child: Text('Delete',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
