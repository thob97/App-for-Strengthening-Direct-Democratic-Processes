import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/pdf_viewer.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/share_button.dart';

class PDFScreen extends StatelessWidget {
  const PDFScreen({required this.title, required this.url});

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title, trailing: _shareButton(context)),
      body: PDFViewer(url: url),
    );
  }

  //TODO needs file path
  Widget _shareButton(BuildContext context) {
    return ShareButton(
      iconColor: Theme.of(context).colorScheme.onPrimary,
      onShare: () async {
        final request = await HttpClient().getUrl(Uri.parse(url));
        final response = await request.close();
        final bytes = await consolidateHttpClientResponseBytes(response);
        final dir = await getApplicationDocumentsDirectory();
        final path = '${dir.path}/$title';
        final File file = File(path);
        await file.writeAsBytes(bytes, flush: true);
        Share.shareFiles([path]);
      },
    );
  }
}
