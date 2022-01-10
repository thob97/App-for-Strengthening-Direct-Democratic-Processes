import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

class Introduction extends StatefulWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  _IntroductionState createState() =>  _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _onIntroEnd(context) async {
    final SharedPreferences sharedPreferences = await _prefs;
    sharedPreferences.setBool('shouldShowIntroductionScreen', false).then((_) {
      Navigator.of(this.context).pushNamed(
        '/home',
        arguments: const NavigationArguments(),
      ); //todo change function
    });
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        //TODO edit and add pages, potentially use images
        PageViewModel(
          title: 'Volksbegehren Berlin',
          body: 'Diese App gibt Ihnen eine Übersicht zu Volksbeteiligungsverfahren in Berlin.\n'
              'Auf den folgenden Seiten erhalten Sie ein paar Hinweise zur Benutzung dieser App.',
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'Hinweis 1',
          body: 'Hinweistext 1',
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Überspringen'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Fertig', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}