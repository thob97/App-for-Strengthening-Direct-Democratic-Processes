import 'package:flutter/material.dart';

class TwoButtInRow extends StatefulWidget {
  const TwoButtInRow({
    Key? key,
    required this.buttonNameOne,
    required this.buttonNameTwo,
    required this.functionOne,
    required this.functionTwo,
  }) : super(key: key);
  final String buttonNameOne;
  final String buttonNameTwo;
  final VoidCallback functionOne;
  final VoidCallback functionTwo;
  @override
  _TwoButtInRowState createState() => _TwoButtInRowState();
}

class _TwoButtInRowState extends State<TwoButtInRow> {
  @override
  Widget build(BuildContext context) {
    return twoButtRow(
      widget.buttonNameOne,
      widget.buttonNameTwo,
      widget.functionOne,
      widget.functionTwo,
    );
  }

  Widget twoButtRow(
    String buttonNameOne,
    String buttonNameTwo,
    VoidCallback functionOne,
    VoidCallback functionTwo,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 2.5),
            child: ElevatedButton(
              onPressed: functionOne,
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(
                buttonNameOne,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 2.5, right: 5.0),
            child: ElevatedButton(
              onPressed: functionTwo,
              style: Theme.of(context).elevatedButtonTheme.style,
              child: Text(
                buttonNameTwo,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
