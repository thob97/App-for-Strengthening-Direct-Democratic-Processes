import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*import '../../softwareproject/lib/test.dart';*/
/*import 'package:real_softwareproject/test.dart';*/
/*import 'real_softwareproject/widget/button_widget.dart'; */
import 'package:real_softwareproject/widget/navigation_drawer_widget.dart';

void main() {
  runApp(MyApp());
  home:
  MainPage();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  ScrollController _scrollController = ScrollController();
  List<Block> block = [
    Block(
        frage: "frage 1",
        antwort:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "),
    Block(frage: "frage 2", antwort: "antwort 2"),
    Block(frage: "frage 3", antwort: "antwort 3"),
    Block(frage: "frage 4", antwort: "antwort 4"),
    Block(frage: "frage 5", antwort: "antwort 5"),
    Block(frage: "frage 6", antwort: "antwort 6"),
    Block(frage: "frage 7", antwort: "antwort 7"),
    Block(frage: "frage 8", antwort: "antwort 8"),
    Block(frage: "frage 9", antwort: "antwort 9"),
    Block(frage: "frage 10", antwort: "antwort 10"),
    Block(frage: "frage 11", antwort: "antwort 11"),
    Block(frage: "frage 12", antwort: "antwort 12"),
    Block(frage: "frage 13", antwort: "antwort 13"),
    Block(frage: "frage 14", antwort: "antwort 14"),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        /*endDrawer: NavigationDrawerWidget(),*/
        appBar: AppBar(
          title: Text("QnA"),
        ),

        /* Test Text*/

        body: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                /* Frage 1 */
                Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: buildQuestions(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  List<Widget> buildQuestions(BuildContext context) {
    return block.map((qnablock) {
      print(GlobalKey());
      return ExpansionTile(
        key: GlobalKey(),
        title: Text(
          qnablock.frage,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        children: [
          Text(
            qnablock.antwort,
            style: TextStyle(fontSize: 18, height: 1.4),
          )
        ],
      );
    }).toList();
  }
}

class Block {
  Block({required this.frage, required this.antwort});
  final String frage;
  final String antwort;
}

/* Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                style: TextStyle(fontSize: 24),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),*/
