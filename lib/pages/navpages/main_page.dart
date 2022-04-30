import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app_bestech/pages/navpages/bar_item_page.dart';
import 'package:travel_app_bestech/pages/home_page.dart';
import 'package:travel_app_bestech/pages/navpages/my_page.dart';
import 'package:travel_app_bestech/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: onTap,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.apps),
            ),
            BottomNavigationBarItem(
              label: 'Bar',
              icon: Icon(Icons.bar_chart_sharp),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'My',
              icon: Icon(Icons.person),
            ),
          ]),
    );
  }
}
