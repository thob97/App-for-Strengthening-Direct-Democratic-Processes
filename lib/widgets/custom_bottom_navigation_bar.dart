import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({required this.selectedIndex});

  final int selectedIndex;

  @override
  _MyBottomNavigationBar createState() => _MyBottomNavigationBar();
}

class _MyBottomNavigationBar extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      currentIndex: widget.selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Start',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacementNamed(
            '/home',
            arguments: const NavigationArguments(),
          );
          break;

        case 1:
          Navigator.of(context).pushReplacementNamed(
            '/discover',
            arguments: const NavigationArguments(),
          );
          break;

        case 2:
          Navigator.of(context).pushReplacementNamed(
            '/news',
            arguments: const NavigationArguments(),
          );
          break;

        case 3:
          Navigator.of(context).pushReplacementNamed(
            '/settings',
            arguments: const NavigationArguments(),
          );
          break;
      }
    });
  }
}
