import 'package:flutter/material.dart';

class CustomFutureBuilder extends StatelessWidget {
  const CustomFutureBuilder({required this.futureData, required this.builder});

  final Future<dynamic> futureData;
  final Widget Function(Object) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureData,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const _WaitingWidget();
          default:
            return snapshot.hasError || snapshot.data == null
                ? _ErrorWidget()
                : builder(snapshot.data!);
        }
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  ///Style
  static const String _errorMsg = 'Etwas ist schiefgelaufen...';

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(_errorMsg));
  }
}

class _WaitingWidget extends StatelessWidget {
  const _WaitingWidget();

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.bottomCenter,
      child: LinearProgressIndicator(),
    );
  }
}
