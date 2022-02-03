import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/main.dart';
import 'package:swp_direktdem_verf_app/pages/discover.dart';
import 'package:swp_direktdem_verf_app/pages/error_page.dart';
import 'package:swp_direktdem_verf_app/pages/faq.dart';
import 'package:swp_direktdem_verf_app/pages/selected_procedure.dart';
import 'package:swp_direktdem_verf_app/pages/settings.dart';
import 'package:swp_direktdem_verf_app/pages/what_happens_next/what_happens_next_showcase.dart';

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

    case '/discover':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Discover());

    case '/faq':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const FAQ());

    case '/settings':
      return PageRouteBuilder(pageBuilder: (_, __, ___) => const Settings());

    case '/selected_procedure':
      return MaterialPageRoute(builder: (_) => SelectedProcedure());

    case '/what_happens_next':
      return MaterialPageRoute(builder: (_) => const WhatHappensNextShowcase());

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
