import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class CardProcedure extends StatelessWidget {
  final String title;
  final String description;
  final String followers;
  final bool followed; //set to true if procedure is followed
  final DateTime date;
  final double progress;

  const CardProcedure(this.title, this.description, this.followers,
      this.followed, this.date, this.progress);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(19),
      ),
      padding: const EdgeInsets.all(4),
      child: Stack(children: <Widget>[
        SizedBox(
          width: 350,
          child: ListTile(
            dense: true,
            title: Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 0.95,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10.0),
                  followed
                      ? _progressBar(progress)
                      : const SizedBox
                          .shrink(), //progressBar nur sichtbar für abo. verfahren
                  const SizedBox(height: 10.0),
                  Text(
                    "Datum: $date",
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white24, fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 0.95,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white24, fontSize: 12),
                    softWrap: true,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 2,
          right: 10,
          child: followed
              ? const Icon(Icons.star, color: Colors.yellow)
              : const Icon(Icons.star, color: Colors.grey),
        ),
        Positioned(
            bottom: 5,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    followers,
                    style: TextStyle(color: Colors.purple, fontSize: 12),
                  ),
                  const Text(" "),
                  const Icon(
                    Icons.people,
                    color: Colors.purple,
                  ),
                ],
              ),
            )),
        Positioned(
          bottom: -10,
          right: 5,
          child: TextButton(
            onPressed: () {}, //todo add function
            child: const Text(
              "MEHR ERFAHREN",
              style: TextStyle(color: Colors.purple, fontSize: 13),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _progressBar(percent) {
    return SizedBox(
      height: 12,
      child: LiquidLinearProgressIndicator(
        value: percent / 100,
        backgroundColor: Colors.white,
        borderColor: Colors.green,
        borderWidth: 1.0,
        borderRadius: 12.0,
        direction: Axis.horizontal,
        center: Text(
          percent.toString() + "%",
          style: const TextStyle(
              fontSize: 12.0, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
    );
  }
}
