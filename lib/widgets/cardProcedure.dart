import 'package:flutter/material.dart';

class CardProcedure extends StatelessWidget {
  final String title;
  final String description;
  final String followers;
  final bool followed; //set to true if procedure is followed
  final DateTime date;

  const CardProcedure(
      this.title, this.description, this.followers, this.followed, this.date);

  //TODO: add Process Bar
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
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 0.95,
                maxLines: 2,
              ),
            ),
            subtitle: Column(
              children: [
                Text(
                  "Datum: $date", //todo textAlign does not work because of subtitle
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.white24, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 0.95,
                  maxLines: 2,
                ),
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
}
