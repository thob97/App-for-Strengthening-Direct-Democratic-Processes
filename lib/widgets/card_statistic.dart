import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

class CardStatistic extends StatefulWidget {
  const CardStatistic({
    required this.title,
    required this.description,
    required this.followed,
  });

  final String title;
  final String description;
  final bool followed; //set to true if statistic is followed

  @override
  _CardStatisticState createState() => _CardStatisticState();
}

class _CardStatisticState extends State<CardStatistic> {
  late bool followed = widget.followed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 350,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(19),
      ),
      padding: const EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 10),
      child: Stack(
        children: <Widget>[
          _myStatisticInfo(),
          _myStarIcon(),
          _moreInfoButton(),
        ],
      ),
    );
  }

  Widget _myStatisticInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _myTitle(),
        const SizedBox(height: 10.0),
        _myDescription(),
      ],
    );
  }

  Widget _myStarIcon() {
    return Positioned(
      top: -10,
      right: -5,
      child: IconButton(
        splashRadius: 0.1,
        icon: Icon(
          followed ? Icons.star : Icons.star_border,
          size: 30,
          color: Colors.orange,
        ),
        onPressed: () {
          setState(() {
            followed = !followed;
          });
        },
      ),
    );
  }

  //mehr erfahren button
  Widget _moreInfoButton() {
    return Positioned(
      bottom: -10,
      right: 5,
      child: TextButton(
        onPressed: () => Navigator.of(context).pushNamed(
          '/selected_process',
          arguments: const NavigationArguments(),
        ), //todo change function
        child: Text(
          'MEHR ERFAHREN',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.apply(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  Widget _myDescription() {
    return Text(
      widget.description,
      style: Theme.of(context).textTheme.bodyText2,
      maxLines: 7,
    );
  }

  Widget _myTitle() {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.headline2,
        maxLines: 2,
      ),
    );
  }
}
