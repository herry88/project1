import 'package:flutter/material.dart';
import 'package:project1/screen/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/tabberpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  print(email);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String? email;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: email == null ? LoginPage() : TabberPage(), //ternary operator
    );
  }
}
