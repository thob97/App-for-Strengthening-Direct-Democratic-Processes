import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/what_happens_next.dart';

class ProcedureStatusError extends StatelessWidget {
  const ProcedureStatusError();

  static const String _titleContent = 'Verfahren Status';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Error'),
      body: WhatHappensNext(
        title: _titleContent,
        state: PageState.error,
        instructions: MockedSelectedProcedureService
            .getDummyWhatHappensNextInstructions(),
      ),
    );
  }
}
