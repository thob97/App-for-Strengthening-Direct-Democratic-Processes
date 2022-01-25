import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar({required this.selectedIndex});

  final int selectedIndex;

  @override
  _MyAnimatedNavBar createState() => _MyAnimatedNavBar();
}

class _MyAnimatedNavBar extends State<AnimatedNavBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: GNav(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        onTabChange: _onItemTapped,
        selectedIndex: widget.selectedIndex,
        rippleColor: Theme.of(context)
            .colorScheme
            .primary, // tab button ripple color when pressed
        hoverColor:
            Theme.of(context).colorScheme.primary, // tab button hover color
        tabBorderRadius: 10,
        tabActiveBorder: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ), // tab button border
        curve: Curves.easeInExpo, // tab animation curves
        gap: 8, // the tab button gap between icon and text
        color:
            Theme.of(context).colorScheme.background, // unselected icon color
        activeColor: Colors.white, // selected icon and text color
        iconSize: 24, // tab button icon size
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor: Theme.of(context).colorScheme.primary,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Start',
          ),
          GButton(
            icon: Icons.search,
            text: 'Entdecke',
          ),
          GButton(
            icon: Icons.notifications,
            text: 'Neuigkeiten',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Einstellungen',
          )
        ],
      ),
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
