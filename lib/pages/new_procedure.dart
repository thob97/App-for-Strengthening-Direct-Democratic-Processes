import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class NewProcedurePage extends StatelessWidget {
  const NewProcedurePage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar('New Procedure'),
      body: Center(
        child: Text('Hallo das ist die New Procedure Seite'),
      ),
    );
  }
}
