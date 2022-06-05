import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold();
  }
}
