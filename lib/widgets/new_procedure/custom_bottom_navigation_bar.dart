import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    required this.onBackWidget,
    required this.onContinueWidget,
  });

  final Widget onBackWidget;
  final Widget onContinueWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                primary: const Color(0xFF194C76),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => onBackWidget,
                  ),
                );
              },
              child: const Text(
                '< ZURÜCK',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2.2,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => onContinueWidget,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                primary: const Color(0xFF194C76),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'WEITER >',
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2.2,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
