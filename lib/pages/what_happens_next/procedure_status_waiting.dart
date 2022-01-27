import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/what_happens_next.dart';

class ProcedureStatusWaiting extends StatelessWidget {
  const ProcedureStatusWaiting();

  static const String _titleContent = 'Verfahren Status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Waiting'),
      body: WhatHappensNext(
        title: _titleContent,
        state: PageState.waiting,
        instructions: MockedSelectedProcedureService
            .getDummyWhatHappensNextInstructions(),
      ),
    );
  }
}
