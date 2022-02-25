import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/selected_procedure.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/success.dart';

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
          heroId: item.id,
          title: item.title,
          subtitle: item.subtitle,
          img: item.img,
          state: item.phaseState,
          success: item.success,
          transitionItems: item.transitionItems,
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: _distBetweenItems),
    );
  }
}

class ProcedureOverview {
  ProcedureOverview({
    required this.id,
    required this.title,
    required this.img,
    required this.subtitle,
    required this.phaseState,
    required this.success,
    required this.transitionItems,
  });

  final String id;
  final String title;
  final File img;
  final String subtitle;
  final int phaseState;
  final ProcedureSuccess success;
  final TransitionItems transitionItems;
}

class _OverviewProcedureTile extends StatelessWidget {
  const _OverviewProcedureTile({
    required this.heroId,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.state,
    required this.success, //TODO show / use this value
    required this.transitionItems,
  });

  final String heroId;
  final File img;
  final String title;
  final String subtitle;
  final int state;
  final ProcedureSuccess success;
  final TransitionItems transitionItems;

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
        onTap: () => _onTap(context),
        child: Row(
          children: [
            Row(
              children: [
                _image(),
                _ProgressIndicator(currentState: state),
              ],
            ),
            _TextContent(title: title, state: state, description: subtitle),
          ],
        ),
      ),
    );
  }

  //TODO add navigation
  void _onTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedProcedure(
          img: img,
          showSubscribe: transitionItems.showSubscribe,
          isSubscribed: transitionItems.isSubscribed,
          showEdit: transitionItems.showEdit,
          title: title,
          id: heroId,
          subtitle: subtitle,
          success: success,
          category: transitionItems.category,
          description: transitionItems.description,
          process: transitionItems.process,
          createDate: transitionItems.createDate,
          creatorFirstName: transitionItems.creatorFirstName,
          creatorLastName: transitionItems.creatorLastName,
          endDate: transitionItems.endDate,
          organisationName: transitionItems.organisationName,
        ),
      ),
    );
  }

  Widget _image() {
    return Hero(
      tag: heroId,
      child: Image.file(
        img,
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
