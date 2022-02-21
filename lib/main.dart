import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';
import 'package:swp_direktdem_verf_app/pages/home.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';

void main() {
  runApp(
    Provider<ServiceDataBase>(
      create: (_) => ServiceDataBase(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volksbegehren Berlin',
      theme: CustomThemeData.lightThemeData,
      home: const Home(),
      initialRoute: '/',
      onGenerateRoute: generateRoute,
    );
  }
}
