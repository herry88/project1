import 'package:flutter/material.dart';
import 'package:project1/helper/databasehelper.dart';
import 'package:project1/screen/tabberpage.dart';

class EditPage extends StatefulWidget {
  List? list;
  int index;
  EditPage({Key? key, this.list, required this.index}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  DBHelper _dbHelper = DBHelper();

  TextEditingController nmproduct = TextEditingController();
  TextEditingController stock = TextEditingController();

  //get data from database
  @override
  void initState() {
    nmproduct =
        TextEditingController(text: widget.list![widget.index]['nmproduct']);
    stock = TextEditingController(text: widget.list![widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.list![widget.index]['nmproduct'],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: nmproduct,
              decoration: InputDecoration(
                labelText: 'Nama Produk',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              controller: stock,
              decoration: InputDecoration(
                labelText: 'Stock',
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  _dbHelper.editData(
                    widget.list![widget.index]['id'],
                    nmproduct.text.trim(),
                    stock.text.trim(),
                  );

                  //redirect
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TabberPage()),
                  );
                },
                child: Text('Ubah'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
