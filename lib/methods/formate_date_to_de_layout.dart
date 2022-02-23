import 'package:intl/intl.dart';

String? formatDateToDELayout(DateTime? date) {
  return date == null ? null : DateFormat('dd-MM-yyyy').format(date);
}
