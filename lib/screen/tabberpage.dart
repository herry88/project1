import 'package:flutter/material.dart';

class TabberPage extends StatefulWidget {
  const TabberPage({Key? key}) : super(key: key);

  @override
  State<TabberPage> createState() => _TabberPageState();
}

class _TabberPageState extends State<TabberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('TabberPage'),
      ),
    );
  }
}
