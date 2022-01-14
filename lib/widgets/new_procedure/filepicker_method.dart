import 'package:file_picker/file_picker.dart';

///Used to load files from systems filePicker
Future<PlatformFile?> filePicker() async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    withData: true,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  //if file picked
  if (result != null) {
    return result.files.first;
  }
  // User canceled the picker
  else {}
}
