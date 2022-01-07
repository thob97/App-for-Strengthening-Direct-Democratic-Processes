import 'package:flutter/material.dart';

class CardProcedure extends StatefulWidget {
  const CardProcedure({
    required this.title,
    required this.description,
    required this.followers,
    required this.followed,
    required this.year,
    required this.month,
    required this.day,
    required this.progress,
  });

  final String title;
  final String description;
  final int followers;
  final bool followed;
  final int year;
  final int month;
  final int day;
  final double progress;

  @override
  _CardProcedureState createState() => _CardProcedureState();
}

class _CardProcedureState extends State<CardProcedure> {
  late bool followed = widget.followed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
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
          _myProcedureInfo(),
          _myStarIcon(),
          _myFollowers(),
          _moreInfoButton(),
        ],
      ),
    );
  }

  Widget _myProcedureInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _myTitle(),
        const SizedBox(height: 10.0),
        if (followed)
          _progressBar()
        else
          const SizedBox
              .shrink(), //progressBar only visible for subscribed Procedures??
        if (followed) const SizedBox(height: 10.0) else const SizedBox.shrink(),
        _myStartDate(),
        const SizedBox(height: 5.0),
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

  Widget _progressBar() {
    return Row(
      children: [
        SizedBox(
          width: 250,
          height: 14,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: widget.progress / 100,
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
          ),
        ),
        Text(
          ' ${widget.progress} %',
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }

  Widget _myFollowers() {
    return Positioned(
      bottom: 2,
      left: 2,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onBackground,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              '${widget.followers} ',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.apply(color: Theme.of(context).colorScheme.onBackground),
            ),
            Icon(
              Icons.people,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _moreInfoButton() {
    return Positioned(
      bottom: -10,
      right: 5,
      child: TextButton(
        onPressed: () {},
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

  Widget _myTitle() {
    return Padding(
      padding: const EdgeInsets.only(right: 40.0),
      //extra right padding for title, so it does not overlap with star
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.headline2,
        maxLines: 2,
      ),
    );
  }

  Widget _myDescription() {
    return Text(
      widget.description,
      style: Theme.of(context).textTheme.bodyText2,
      maxLines: 6,
    );
  }

  Widget _myStartDate() {
    final int day = widget.day;
    final int month = widget.month;
    final int year = widget.year;
    return Text(
      'Startdatum: $day.$month.$year',
      style: Theme.of(context).textTheme.bodyText2,
      maxLines: 1,
    );
  }
}
