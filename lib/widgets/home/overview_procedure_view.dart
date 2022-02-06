import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

class ProcedureOverview {
  ProcedureOverview({
    required this.title,
    required this.description,
    required this.state,
    required this.img,
  });

  final String title;
  final String description;
  final int state;
  final String img;
}

class OverviewProcedureView extends StatelessWidget {
  const OverviewProcedureView({required this.items});

  final List<ProcedureOverview> items;

  ///Style
  static const double _distBetweenItems = 2;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: _distBetweenItems),
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final ProcedureOverview item = items[index];
        return _OverviewProcedureTile(
          heroId: index,
          title: item.title,
          description: item.description,
          assetImg: item.img,
          state: item.state,
          onTap: () => _onTap(context),
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: _distBetweenItems),
    );
  }

  //TODO add navigation
  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/selected_procedure',
      arguments: const NavigationArguments(),
    );
  }
}

class _OverviewProcedureTile extends StatelessWidget {
  const _OverviewProcedureTile({
    required this.heroId,
    required this.title,
    required this.description,
    required this.state,
    required this.assetImg,
    this.onTap,
  });

  final int heroId;
  final String title;
  final String description;
  final int state;
  final String assetImg;
  final VoidCallback? onTap;

  ///Style
  static const double _height = 80;
  static const double _imgWidth = 100;
  static const double _padding = 10;
  static const int _descriptionMaxLines = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Row(
              children: [
                _image(),
                _ProgressIndicator(currentState: state),
              ],
            ),
            _TextContent(title: title, state: state, description: description),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Hero(
      tag: heroId,
      child: Image.asset(
        assetImg,
        height: _height, //max height
        width: _imgWidth,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({
    required this.title,
    required this.description,
    required this.state,
  });

  final String title;
  final String description;
  final int state;

  ///Style
  static const double _distBetweenTitleAndDescription = 4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(_OverviewProcedureTile._padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            const SizedBox(height: _distBetweenTitleAndDescription),
            _description(context),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: Theme.of(context).textTheme.subtitle2,
      maxLines: 1,
    );
  }

  Widget _description(BuildContext context) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyText2,
      overflow: TextOverflow.ellipsis,
      maxLines: _OverviewProcedureTile._descriptionMaxLines,
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  const _ProgressIndicator({required this.currentState});

  final int currentState;
  static const int numOfStates = 3;

  ///Style
  static const double _circleSize = 8;
  static const double _horPadding = 6;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _horPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(numOfStates, (index) {
          return Container(
            height: _circleSize,
            width: _circleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index < currentState
                  ? Theme.of(context).colorScheme.onBackground
                  : Theme.of(context).colorScheme.background,
            ),
          );
        }),
      ),
    );
  }
}
