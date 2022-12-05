import 'package:delightfood/profile/profilebar.dart';
import 'package:flutter/material.dart';
import '../home/home.dart';
import 'appbar.dart';
import '../profile/profile.dart';
import '../search/kategori.dart';
import '../resep/inputresep.dart';

// import 'package:delightfood/search.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BaseAppState createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[  
    HomePage(),
    InputResep(),
    Kategori(),
    Profile(),
    BaseAppBar(),
    BaseAppBar(),
    BaseAppBar(),
    ProfileBar(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFff9934),
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
          // The search area here
        title: Center(
          child: _widgetOptions.elementAt(_selectedIndex+4),
        )
      ),

      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add_outlined),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFFF6925C),
        onTap: _onItemTapped,
        backgroundColor: const Color(0xFFFFF5F1),
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}