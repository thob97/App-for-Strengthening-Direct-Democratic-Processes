import 'package:flutter/material.dart';
import 'pages/start.dart';
import 'pages/discover.dart';
import 'pages/news.dart';
import 'pages/settings.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [Start(), Discover(), News(), Settings()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Start",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Discover",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: "News",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
