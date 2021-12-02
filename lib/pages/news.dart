import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar('News'),
      body: Center(
        child: Text("Hallo das ist die Seite News"),
      ),
    );
  }
}
