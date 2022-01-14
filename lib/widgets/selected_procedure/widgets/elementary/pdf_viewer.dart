import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

///used for loading and viewing pdfs from url
class PDFViewer extends StatefulWidget {
  const PDFViewer({required this.url});

  final String url;

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? _currentPage = 0;

  //keep for potential error handling
  // ignore: unused_field
  bool _pageIsReady = false;

  // ignore: unused_field
  String _errorMessage = '';

  Future<File>? _downloadingPDF;

  @override
  void initState() {
    super.initState();
    _downloadingPDF = createFileOfPdfUrl();
  }

  Future<File>? createFileOfPdfUrl() async {
    final Completer<File> completer = Completer();
    //print("Start download file from internet!");
    try {
      final filename = widget.url.substring(widget.url.lastIndexOf('/') + 1);
      final request = await HttpClient().getUrl(Uri.parse(widget.url));
      final response = await request.close();
      final bytes = await consolidateHttpClientResponseBytes(response);
      final dir = await getApplicationDocumentsDirectory();
      //print("Download files");
      //print("${dir.path}/$filename");
      final File file = File('${dir.path}/$filename');

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      return completer.future;
    }
    //E.g. not a valid pdf url
    catch (e) {
      throw Exception('Error parsing asset file!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _downloadingPDF,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return _pdfView((snapshot.data! as File).path);
        } else {
          return _customCircularProgressIndicator();
        }
      },
    );
  }

  Widget _pdfView(String _pdfPath) {
    return PDFView(
      filePath: _pdfPath,
      //enableSwipe: true,
      //swipeHorizontal: false,
      autoSpacing: false,
      //pageFling: true,
      //pageSnap: true,
      defaultPage: _currentPage!,
      fitPolicy: FitPolicy.BOTH,
      // if set to true the link is handled in flutter
      //preventLinkNavigation: false,
      onRender: (_pages) {
        setState(() {
          pages = _pages;
          _pageIsReady = true;
        });
      },
      onError: (error) {
        setState(() {
          _errorMessage = error.toString();
        });
        //print(error.toString());
      },
      onPageError: (page, error) {
        setState(() {
          _errorMessage = '$page: ${error.toString()}';
        });
        //print('$page: ${error.toString()}');
      },
      onViewCreated: (PDFViewController pdfViewController) {
        _controller.complete(pdfViewController);
      },
      onLinkHandler: (String? uri) {
        //print('goto uri: $uri');
      },
      onPageChanged: (int? page, int? total) {
        //print('page change: $page/$total');
        setState(() {
          _currentPage = page;
        });
      },
    );
  }

  Widget _customCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
