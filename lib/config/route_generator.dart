import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/main.dart';
import 'package:swp_direktdem_verf_app/pages/error_page.dart';
import 'package:swp_direktdem_verf_app/pages/favorite.dart';
import 'package:swp_direktdem_verf_app/pages/news.dart';
import 'package:swp_direktdem_verf_app/pages/selected_procedure.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/my_procedures.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.arguments == null || settings.name == null) {
    return MaterialPageRoute(builder: (_) => ErrorPage());
  }

  // ignore:unused_local_variable
  final args = settings.arguments! as NavigationArguments;

  switch (settings.name) {
    case '/':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MyApp());

    case '/home':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const MyApp());

    case '/favorite':
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const FavoritePage(),
      );

    case '/news':
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const News(),
      );

    case '/settings':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Settings());

    case '/my_procedures':
      return MaterialPageRoute(builder: (_) => const MyProcedures());

    case '/selected_procedure':
      return MaterialPageRoute(builder: (_) => const SelectedProcedure());

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
