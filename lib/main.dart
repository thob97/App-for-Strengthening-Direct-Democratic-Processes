import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:swp_direktdem_verf_app/config/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final bool shouldShowIntroductionPage = sharedPreferences.getBool('shouldShowIntroductionScreen') ?? true;

  runApp(MyApp(
      shouldShowIntroductionScreen: shouldShowIntroductionPage,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    required this.shouldShowIntroductionScreen,
  });

  final bool shouldShowIntroductionScreen;

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volksbegehren Berlin',
      theme: CustomThemeData.lightThemeData,
      onGenerateInitialRoutes: (String initialRouteName) {
        return [
          generateRoute(widget.shouldShowIntroductionScreen
              ? const RouteSettings(name: '/intro', arguments: NavigationArguments())
              : const RouteSettings(name: '/home', arguments: NavigationArguments()),
          )
        ];
      },
      onGenerateRoute: generateRoute,
    );
  }
}
