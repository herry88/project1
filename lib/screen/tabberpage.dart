import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:project1/screen/profile.dart';

import 'homePage.dart';

class TabberPage extends StatefulWidget {
  const TabberPage({Key? key}) : super(key: key);

  @override
  State<TabberPage> createState() => _TabberPageState();
}

class _TabberPageState extends State<TabberPage> {
  int _index = 0;
  late PageController _pageController;

  //array
  List _title = ['Home', 'Profile'];
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title[_index],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          children: [
            HomePage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    return BottomNavyBar(
      selectedIndex: _index,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.amber,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          activeColor: Colors.amber,
        ),
      ],
      onItemSelected: (_index) {
        setState(() {
          _index = _index;
        });
      },
    );
  }
}
