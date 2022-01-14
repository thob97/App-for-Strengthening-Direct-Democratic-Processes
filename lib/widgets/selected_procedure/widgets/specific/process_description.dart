import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';

class ProcessDescription extends StatelessWidget {
  const ProcessDescription({
    required this.titleContent,
    required this.descriptionContent,
    required this.categoryContent,
  });

  final String titleContent;
  final String descriptionContent;
  final List<List<String>> categoryContent;

  ///Style
  static const double _verPad = 18;
  static const double _distanceBetweenTitleAndDescription = 8;
  static const double _distanceBetweenDescriptionAndCategories = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: MyConstants.horPagePadding,
        vertical: _verPad,
      ),
      child: Column(
        children: [
          _myTitle(context),
          const SizedBox(height: _distanceBetweenTitleAndDescription),
          _myDescription(context),
          const SizedBox(height: _distanceBetweenDescriptionAndCategories),
          MyCategories(content: categoryContent),
        ],
      ),
    );
  }

  Widget _myTitle(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        titleContent,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Widget _myDescription(BuildContext context) {
    return Text(
      descriptionContent,
      style: Theme.of(context).textTheme.bodyText1,
      overflow: TextOverflow.visible,
    );
  }
}

class MyCategories extends StatelessWidget {
  const MyCategories({required this.content});

  final List<List<String>> content;
  List<String> get _categoryList => content[0];
  List<String> get _contentList => content[1];

  ///Style
  static const double _distanceBetweenCategoryAndContent = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _categoryKey(context),
        const SizedBox(width: _distanceBetweenCategoryAndContent),
        _categoryValue(context),
      ],
    );
  }

  Widget _categoryKey(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _textListBuilder(
        _categoryList,
        Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }

  Widget _categoryValue(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _textListBuilder(
        _contentList,
        Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  List<Widget> _textListBuilder(List<String> categoryList, TextStyle? style) {
    final List<Widget> _list = [];
    for (final String category in categoryList) {
      _list.add(Text(category, style: style));
    }
    return _list;
  }
}
