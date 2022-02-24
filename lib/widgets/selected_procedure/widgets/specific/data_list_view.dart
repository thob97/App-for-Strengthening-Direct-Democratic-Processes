import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/pdf_screen.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/card_list_view.dart';

class DataListView extends StatelessWidget {
  const DataListView({required this.dataList});

  final List<Data> dataList;

  ///Style
  static const IconData _dataIcon = Icons.insert_drive_file_outlined;

  @override
  Widget build(BuildContext context) {
    return dataList.isEmpty
        ? _noDataPlaceholder()
        : CardListView(
            widgetList:
                dataList.map((Data data) => _item(context, data)).toList(),
          );
  }

  Widget _item(BuildContext context, Data data) {
    return ListTile(
      dense: true,
      minLeadingWidth: 0,
      leading: _itemIcon(context),
      title: _itemText(context, data.title),
      onTap: () => _itemOnTap(context, data.title, data.url),
    );
  }

  Icon _itemIcon(BuildContext context) {
    return Icon(
      _dataIcon,
      color: Theme.of(context).iconTheme.color,
    );
  }

  Text _itemText(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .caption
          ?.copyWith(fontSize: Theme.of(context).textTheme.bodyText2?.fontSize),
    );
  }

  void _itemOnTap(BuildContext context, String title, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFScreen(
          title: title,
          url: url,
        ),
      ),
    );
  }

  Widget _noDataPlaceholder() {
    return const Center(
      child: Text('Es wurden noch keine Dokumente veröffentlicht'),
    );
  }
}

class Data {
  Data({
    required this.title,
    required this.url,
  });

  String title;
  String url;
}
