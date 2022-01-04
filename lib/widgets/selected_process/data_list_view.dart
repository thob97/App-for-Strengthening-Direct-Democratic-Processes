import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/pdf_screen.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_process/custom_card.dart';

class DataListView extends StatelessWidget {
  const DataListView({required this.dataList});

  final List<Data> dataList;

  ///Style
  static const double _dividerHorPadding = 20;
  static const IconData _dataIcon = Icons.insert_drive_file_outlined;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return _item(context, index);
        },
        separatorBuilder: (context, index) {
          return _customDivider(context);
        },
      ),
    );
  }

  Widget _item(BuildContext context, int index) {
    return ListTile(
      dense: true,
      minLeadingWidth: 0,
      leading: _itemIcon(context),
      title: _itemText(context, dataList[index].title),
      onTap: () => _itemOnTap(
        context,
        dataList[index].title,
        dataList[index].url,
      ),
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
      style: Theme.of(context).textTheme.headline2,
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

  Widget _customDivider(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: _dividerHorPadding),
      child: Divider(),
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
