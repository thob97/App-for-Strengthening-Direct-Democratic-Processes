import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/*import '../../softwareproject/lib/test.dart';*/
/*import 'package:real_softwareproject/test.dart';*/
/*import 'real_softwareproject/widget/button_widget.dart'; */
import 'package:real_softwareproject/widget/navigation_drawer_widget.dart';

class qna extends StatelessWidget {
  ScrollController _scrollController = ScrollController();

  List<Block> block = [
    Block(
        frage: "Wie verläuft der Weg zum Volksentscheid?",
        antwort:
            "Wie auch in allen anderen Bundesländern können Bürger*innen in Berlin in einem Volksentscheid über einzelne Gegenstände der Landespolitik selbst entscheiden. Die dreistufige Volksgesetzgebung gibt Bürger*innen das Recht, selbst Gesetzesinitiativen zu starten und bei genügend Unterschriften einen berlinweiten und verbindlichen Volksentscheid dazu herbeizuführen. Die Stufen beim Volksentscheid lauten: Antrag auf Volksbegehren, Volksbegehren und Volksentscheid. Insgesamt dauert ein Verfahren bis zum Entscheid ca. 2 Jahre. "),
    Block(
        frage: "Was ist ein Antrag auf Volksbegehren?",
        antwort:
            "Der \"Antrag auf Durchführung eines Volksbegehrens\" - auch Zulassungsantrag genannt -kann von Einzelpersonen, einer Mehrheit von Personen, Personenvereinigungen oder Parteien bei der Senatsverwaltung für Inneres gestellt werden. Er stellt die erste Stufe im Verfahren zum Volksentscheid dar. Ein Volksbegehren zur Änderung eines Gesetzes bzw. zu sonstigen Gegenständen muss von mindestens 20.000 wahlberechtigten Bürgerinnen und Bürgern unterstützt werden. Bei einem Antrag auf Parlamentsauflösung oder bei Verfassungsänderungen sind 50.000 Unterschriften erforderlich"),
    Block(
        frage: "Was ist ein Volksbegehren?",
        antwort:
            "Bei Zulässigkeit des Volksbegehrensantrags kann das Abgeordnetenhaus innerhalb von vier Monaten das Anliegen übernehmen. Ansonsten kann innerhalb eines Monats ein Volksbegehren beantragt werden. Es ist zustande gekommen, wenn es innerhalb von vier Monaten von sieben Prozent der zum Abgeordnetenhaus von Berlin Wahlberechtigten unterstützt wird - bei Volksbegehren zu Verfassungsänderungen oder einer Parlamentsauflösung sind 20 Prozent nötig."),
    Block(
        frage: "Was ist ein Volksentscheid?",
        antwort:
            "Spätestens vier Monate nach Feststellung des Zustandekommens (acht Monate bei Zusammenlegung mit einer Wahl) findet über den Gegenstand des Volksbegehrens ein Volksentscheid statt (bei einer Parlamentsauflösung nach zwei Monaten). Das Landesparlament kann einen eigenen Alternativvorschlag zur Abstimmung stellen. Der Volksentscheid unterbleibt, wenn das Abgeordnetenhaus den Gesetzentwurf des Volksbegehrens in seinem wesentlichen Bestand unverändert übernimmt. Stimmberechtigt sind alle am Tag des Volksentscheids zum Abgeordnetenhaus von Berlin Wahlberechtigten"),
    Block(
        frage: "Wie kann ich ein Volksbegehren unterstützen?",
        antwort:
            "Am besten unterstützt man einen Volksbegehrensantrag in dem du deine Unterstützungsunterschrift auf einer offiziellen Unterschriftenliste gibst. Du willst noch mehr tun? Ein Volksbegehren gelingt oft auch nur, wenn genügend ehrenamtliche Menschen Unterschriften für dieses auf der Straße sammeln. Wenn du begeistert von einer initiative bist, wende dich am besten an die Verantwortlichen und frage, wie du dich einbringen kannst."),
    Block(
        frage:
            "Darf ich einen Volksbegehrensantrag / ein Volksbegehren unterschreiben?",
        antwort:
            "Es sind nur Unterschriften auf den Listen von Menschen gültig, die \n \n- in Berlin ihren Hauptwohnsitz haben \n- 18 Jahre oder älter sind \n- die deutsche Staatsbürgerschaft besitzen \n \nNiemand hält dich davon ab und es ist auch nicht verboten einen Volksbegehrensantrag bzw. ein Volksbegehren zu unterschreiben, auch wenn die oben stehenden Kriterien nicht auf dich zutreffen."),
    Block(
        frage: "Kann ich Volksbegehren auch online unterschreiben?",
        antwort:
            "Leider nein. Unterstützungsunterschriften für Volksbegehrensanträge und Volksbegehren dürfen laut Gesetz leider nur handschriftlich getätigt werden. Deshalb am besten auf der Straße bei Unterschriftensammler*innen oder in Geschäften unterschreiben, in denen Listen ausliegen. Die Hürden für Volksbegehren sind höher, als beispielsweise bei Petitionen, da am Ende dieses Verfahrens ein verbindlicher Entscheid steht. "),
    Block(
        frage:
            "Ich soll auf der Straße meine Unterschrift geben - Was ist mit dem Datenschutz? ",
        antwort:
            "Wenn eine Initiative glaubt, genügend Unterschriften für einen Volksbegehrensantrag oder ein Volksbegehren zusammen zu haben, reichen sie diese bei der Senatsverwaltung für Inneres ein. Nach der Prüfung, ob die Kriterien für eine gültige Unterschrift zutreffen (Wahlalter, Staatsbürgerschaft, Wohnsitz), werden die Listen vernichtet. Daten auf unterschriftenlisten dürfen nicht an Dritte weitergegeben werden. "),
    Block(
        frage: "Wer ist die Trägerin? Was sind Vertrauenspersonen?",
        antwort:
            "Die Trägerin = verantwortliche Initiative, Organisation usw.\nDie Vertrauenspersonen = verantwortliche und entscheidungsberechtigte Ansprechpersonen"),
    Block(
        frage: "Beratungsangebot Initiativen",
        antwort:
            "Sie wollen ein Bürger- oder Volksbegehren starten? \n \nWir stehen Ihnen gerne mit Rat und Tat zur Seite, denn vor dem Start einer Initiative oder während des Verfahrens tauchen viele Fragen auf:\n \n• Ist das Thema des geplanten Bürger- oder \n   Volksbegehrens überhaupt zulässig?\n• Wie sollte die Fragestellung formuliert werden?\n• Was ist bei der Gestaltung der Unterschriftenliste zu \n   beachten?\n• Welche Fristen müssen beachtet werden?\n• Was kann man tun, wenn das Bürger- oder \n   Volksbegehren für unzulässig erklärt wird?\n\nVor dem Start empfehlen wir Ihnen, direkten Kontakt mit uns aufzunehmen, um ein Beratungsgespräch zu vereinbaren. Bei uns bekommen Sie nicht nur Informationen zum Verfahrensablauf, sondern auch Tipps zur Durchführung einer Kampagne und zur Öffentlichkeitsarbeit.\n\nGegen eine kleine Aufwandsentschädigung beraten wir Sie gern:\n\nBürgerbegehrenberatung - 78 Euro oder Mitgliedschaft bei Mehr Demokratie\nVolksbegehrensberatung - 100 Euro oder Mitgliedschaft bei Mehr Demokratie\n\nAls Lektüre zur Einführung und um einen Überblick über das Verfahren zu bekommen, empfehlen wir Ihnen unsere Merkblätter: https://bb.mehr-demokratie.de/service-beratung/beratung/merkblaetter-berlin"),
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
          maxLines: 2,
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
  Block({
    required this.frage,
    required this.antwort,
  });
  final String frage;
  final String antwort;
}

  /* Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
                  style: TextStyle(fontSize: 24),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),*/
