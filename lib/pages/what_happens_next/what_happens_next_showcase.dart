import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/what_happens_next.dart';

class WhatHappensNextShowcase extends StatelessWidget {
  const WhatHappensNextShowcase();

  static const String _titleContent = 'Was passiert als nächstes?';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Showcase'),
      body: WhatHappensNext(
        title: _titleContent,
        state: PageState.showcase,
        instructions: MockedSelectedProcedureService
            .getDummyWhatHappensNextInstructions(),
      ),
    );
  }
}
