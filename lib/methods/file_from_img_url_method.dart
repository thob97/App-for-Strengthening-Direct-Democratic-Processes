import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

//TODO add: if file already present: return it instead of overriding it
Future<File> fileFromImageUrl(String url, String fileName) async {
  final response = await http.get(Uri.parse(url));
  final documentDirectory = await getApplicationDocumentsDirectory();
  final file = File(join(documentDirectory.path, fileName));
  file.writeAsBytesSync(response.bodyBytes);
  return file;
}
