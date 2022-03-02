import 'package:flutter/material.dart';

Color colorPageNumber1 = Colors.grey;
Color colorPageNumber2 = Colors.grey;
Color colorPageNumber3 = Colors.grey;

class PageProgressBar extends StatelessWidget {
  const PageProgressBar({required this.currentPageNumber});

  final int currentPageNumber;

  @override
  Widget build(BuildContext context) {
    if (currentPageNumber == 1) {
      colorPageNumber1 = Colors.blue;
      colorPageNumber2 = Colors.grey;
      colorPageNumber3 = Colors.grey;
    }
    if (currentPageNumber == 2) {
      colorPageNumber2 = Colors.blue;
      colorPageNumber1 = Colors.grey;
      colorPageNumber3 = Colors.grey;
    }
    if (currentPageNumber == 3) {
      colorPageNumber3 = Colors.blue;
      colorPageNumber1 = Colors.grey;
      colorPageNumber2 = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Container(
              width: 35.0,
              height: 35.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorPageNumber1,
                shape: BoxShape.circle,
              ),
              child: const Text('1'),
            ),
          ),
          Container(
            height: 1.0,
            width: 80.0,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              width: 35.0,
              height: 35.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorPageNumber2,
                shape: BoxShape.circle,
              ),
              child: const Text('2'),
            ),
          ),
          Container(
            height: 1.0,
            width: 80.0,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              width: 35.0,
              height: 35.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colorPageNumber3,
                shape: BoxShape.circle,
              ),
              child: const Text('3'),
            ),
          ),
        ],
      ),
    );
  }
}
