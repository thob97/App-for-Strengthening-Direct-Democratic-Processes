import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';

class MyExpansionPanelList extends StatefulWidget {
  const MyExpansionPanelList({required this.topics});

  final List<Topic> topics;

  ///Style
  static const double _distBetweenHeaderAndBody = 10;
  static const double _bottomExpandedWidgetPadding = 20;

  @override
  _MyExpansionPanelListState createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  //ListView instead of Column for performance and animations
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.topics.length,
      itemBuilder: (context, index) {
        final Topic topic = widget.topics[index];
        return ExpansionTile(
          title: _myHeader(topic.header),
          tilePadding: const EdgeInsets.symmetric(
            horizontal: MyConstants.horPagePadding,
          ),
          childrenPadding: const EdgeInsets.only(
            top: MyExpansionPanelList._distBetweenHeaderAndBody,
            bottom: MyExpansionPanelList._bottomExpandedWidgetPadding,
          ),
          //when expanded
          textColor: Theme.of(context).colorScheme.onBackground,
          iconColor: Theme.of(context).colorScheme.onBackground,
          children: [topic.expandedWidget],
        );
      },
    );
  }

  Widget _myHeader(String content) {
    final TextStyle _theme = Theme.of(context).textTheme.headline5!;
    return Text(
      content,
      //TextStyle called this way so that no color is specified for
      //'ExpansionTile textColor'. So that expansion changes color
      style: TextStyle(
        fontFamily: _theme.fontFamily,
        fontWeight: _theme.fontWeight,
        fontSize: _theme.fontSize,
        overflow: _theme.overflow,
      ),
    );
  }
}

class Topic {
  Topic({
    required this.header,
    required this.expandedWidget,
  });
  Widget expandedWidget;
  String header;
}
