import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/what_happens_next.dart';

class WhatHappensNextPage extends StatelessWidget {
  const WhatHappensNextPage({required this.appbarTitle, required this.body});

  factory WhatHappensNextPage.showcase() {
    return WhatHappensNextPage(
      appbarTitle: 'Showcase',
      body: WhatHappensNext.showcase(
        title: 'Was passiert als nächstes?',
        instructions: _getInstructions(),
      ),
    );
  }

  factory WhatHappensNextPage.waiting() {
    return WhatHappensNextPage(
      appbarTitle: 'Verfahren Status',
      body: WhatHappensNext.waiting(
        title: 'Waiting',
        index: 0,
        instructions: _getInstructions(),
      ),
    );
  }

  factory WhatHappensNextPage.error() {
    return WhatHappensNextPage(
      appbarTitle: 'Verfahren Status',
      body: WhatHappensNext.error(
        title: 'Error',
        index: 0,
        instructions: _getInstructions(),
      ),
    );
  }

  final String appbarTitle;
  final WhatHappensNext body;

  static List<Instructions> _getInstructions() {
    return [
      Instructions(
        title: 'Überprüfung',
        subtitle: 'Ihr Antrag wird von uns auf Fehler überprüft.',
        asset: 'assets/what_happens_next/receive.png',
      ),
      Instructions(
        title: 'Bearbeitung',
        subtitle:
            'Nach erfolgreicher Prüfung werden wir Ihr Verfahren in eine Phase einordnen.',
        asset: 'assets/what_happens_next/confirmed.png',
      ),
      Instructions(
        title: 'Veröffentlichung',
        subtitle: 'Im Anschluss wird Ihr Verfahren veröffentlicht.',
        asset: 'assets/what_happens_next/ready.png',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appbarTitle),
      body: body,
    );
  }
}
