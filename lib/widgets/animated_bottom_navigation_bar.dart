import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

class AnimatedNavBar extends StatelessWidget {
  const AnimatedNavBar({required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GNav(
      tabMargin:
          const EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      selectedIndex: selectedIndex,
      rippleColor: Theme.of(context).colorScheme.primary,
      // tab button ripple color when pressed
      hoverColor: Theme.of(context).colorScheme.primary,
      // tab button hover color
      tabBorderRadius: MyConstants.borderRadius,
      tabActiveBorder: Border.all(color: Theme.of(context).colorScheme.primary),
      // tab button border
      curve: Curves.easeInExpo,
      // tab animation curves
      gap: 8,
      // the tab button gap between icon and text
      color: Theme.of(context).colorScheme.background,
      // unselected icon color
      activeColor: Colors.white,
      // selected icon and text color
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      duration: const Duration(milliseconds: 600),
      tabBackgroundColor: Theme.of(context).colorScheme.primary,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/home',
              arguments: const NavigationArguments(),
            );
          },
        ),
        GButton(
          icon: Icons.bar_chart,
          text: 'Dashboard',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/dashboard',
              arguments: const NavigationArguments(),
            );
          },
        ),
        GButton(
          icon: Icons.favorite,
          text: 'Favoriten',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/favorite',
              arguments: const NavigationArguments(),
            );
          },
        ),
        GButton(
          icon: Icons.settings,
          text: 'Einstellungen',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              '/settings',
              arguments: const NavigationArguments(),
            );
          },
        )
      ],
    );
  }
}
