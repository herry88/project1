import 'package:flutter/material.dart';
import 'package:project1/helper/databasehelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addpage.dart';
import 'detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBHelper dbHelper = DBHelper();

  String? email;
  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('email') ?? 0;
    setState(() {
      print(value);
      email = prefs.getString('email');
      print(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {
            dbHelper.getData();
          });
        },
        child: FutureBuilder<List>(
          future: dbHelper.getData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? ItemList(list: snapshot.data)
                : const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  List? list;
  ItemList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            //detail
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return DetailPage(
                  list: list,
                  index: index,
                );
              }),
            );
          },
          child: Card(
              child: ListTile(
            title: Text(list![index]['nmproduct']),
          )),
        );
      },
    );
  }
}
