import 'package:flutter/material.dart';

class TwoButtInRow extends StatefulWidget {
  const TwoButtInRow({
    Key? key,
    required this.buttonNameOne,
    required this.buttonNameTwo,
    required this.functionOne,
    required this.functionTwo
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
    return twoButtRow(widget.buttonNameOne, widget.buttonNameTwo,
        widget.functionOne, widget.functionTwo,);
  }

  Widget twoButtRow(
    String buttonNameOne,
    String buttonNameTwo, void functionOne, void functionTwo,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(
            buttonNameOne,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: Theme.of(context).elevatedButtonTheme.style,
          child: Text(
            buttonNameTwo,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        )
      ],
    );
  }
}
