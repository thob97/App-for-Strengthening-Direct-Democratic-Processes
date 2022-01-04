import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

///DONE
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
  bool _pageIsReady = false;
  String _errorMessage = '';

  String _pdfPath = '';
  bool _downloadingPDF = true;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  Future<void> _initPdf() async {
    _downloadingPDF = true;
    final File _file = await createFileOfPdfUrl();
    setState(() {
      _pdfPath = _file.path;
      _downloadingPDF = false;
    });
  }

  Future<File> createFileOfPdfUrl() async {
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
    }
    //E.g. not a valid pdf url
    catch (e) {
      throw Exception('Error parsing asset file!');
    }
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return _pdfViewerWaitForDownload();
  }

  Widget _pdfViewerWaitForDownload() {
    //ProgressIndicator while downloading PDF
    return _downloadingPDF
        ? _customCircularProgressIndicator()
        : _pdfViewerWaitForPage();
  }

  Widget _pdfViewerWaitForPage() {
    return Stack(
      children: <Widget>[
        _waitForPage(),
        _pdfView(),
      ],
    );
  }

  Widget _pdfView() {
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

  Widget _waitForPage() {
    return _errorMessage.isEmpty
        ? !_pageIsReady
            ? _customCircularProgressIndicator()
            : Container()
        : Center(child: Text(_errorMessage));
  }

  Widget _customCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );
  }
}
