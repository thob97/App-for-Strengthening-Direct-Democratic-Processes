import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';

///Looks like card, but it prevents ripple / splash effects
/// to overflow over the cards edges.
class CustomCard extends StatelessWidget {
  const CustomCard({required this.child});

  final Widget child;

  ///Style
  static const double _horPad = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horPad),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MyConstants.borderRadius),
        child: Material(
          color: Theme.of(context).cardTheme.color,
          child: child,
        ),
      ),
    );
  }
}
