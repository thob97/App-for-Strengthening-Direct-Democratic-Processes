import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/discover.dart';
import 'package:swp_direktdem_verf_app/pages/error_page.dart';
import 'package:swp_direktdem_verf_app/pages/introduction.dart';
import 'package:swp_direktdem_verf_app/pages/news.dart';
import 'package:swp_direktdem_verf_app/pages/selected_process.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/start.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.arguments == null || settings.name == null) {
    return MaterialPageRoute(builder: (_) => ErrorPage());
  }

  // ignore:unused_local_variable
  final args = settings.arguments! as NavigationArguments;

  switch (settings.name) {
    /*
    case '/':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MyApp(shouldShowIntroductionScreen: false,));
    */
    case '/intro':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Introduction());

    case '/home':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Start());

    case '/discover':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Discover());

    case '/news':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const News());

    case '/settings':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Settings());

    case '/selected_process':
      return MaterialPageRoute(builder: (_) => SelectedProcess());

    ///With animation
    //return MaterialPageRoute(builder: (_) => const Settings());
    ///Without animation
    //return PageRouteBuilder(pageBuilder: (_, __, ___) => const Settings());

    ///How to use
    //Push
    //Navigator.of(context).pushReplacementNamed('/settings', arguments: const NavigationArguments());
    //Push on top (with back button)
    //Navigator.of(context).pushNamed('/settings', arguments: const NavigationArguments());

    ///NavigationArguments e.g.
    /*
    case '/page':
      return MaterialPageRoute(
        builder: (_) => Page(
          id: args.id!,
          title: args.title!,
          backendService: args.backendService!,
        ),
      );
*/

    default:
      return MaterialPageRoute(builder: (_) => ErrorPage());
  }
}

class NavigationArguments {
  const NavigationArguments({
    this.id,
    this.title,
  });

  final String? id;
  final String? title;
}
