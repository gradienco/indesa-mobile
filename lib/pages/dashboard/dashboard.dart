import 'package:flutter/material.dart';
import 'package:indesa_beta/constant/constant.dart';
import 'package:indesa_beta/pages/help/help_page.dart';
import 'package:indesa_beta/pages/history/history_page.dart';
import 'package:indesa_beta/pages/history_soal/history_soal_page.dart';
import 'package:indesa_beta/pages/home/home_page.dart';
import 'package:indesa_beta/pages/index/index_page.dart';
import 'package:indesa_beta/pages/profile/profile_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedTabIndex = 2;

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _listPage = <Widget>[
      ProfilePage(),
      HistoryPage(),
      HomePage(),
      IndexPage(),
      HelpPage(),
    ];

    final _bottomNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text("Akun"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history),
        title: Text("Riwayat"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text("Beranda"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.dehaze),
        title: Text("Indeks"),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        title: Text("Bantuan"),
      ),
    ];

    final _bottomNavBar = BottomNavigationBar(
      elevation: 10,
      items: _bottomNavBarItems,
      currentIndex: _selectedTabIndex,
      selectedItemColor: cDarkGreen,
      unselectedItemColor: Colors.grey,
      onTap: _onNavBarTapped,
    );

    return Scaffold(
      body: _listPage[_selectedTabIndex],
      bottomNavigationBar: _bottomNavBar,
    );
  }
}