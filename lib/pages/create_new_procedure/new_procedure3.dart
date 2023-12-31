import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure1.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure4.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/custom_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/input_text_heading.dart';
import 'package:swp_direktdem_verf_app/widgets/new_procedure/page_progress_bar.dart';

List<Document> documentList = [];

class NewProcedure3 extends StatefulWidget {
  const NewProcedure3({Key? key}) : super(key: key);

  @override
  _NewProcedureState3 createState() => _NewProcedureState3();
}

class _NewProcedureState3 extends State<NewProcedure3> {
  bool isChecked = false;

  void delete(int id) {
    documentList.removeAt(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Neues Verfahren erstellen'),
      bottomNavigationBar: const CustomBottomNavigationBar(
        onBackWidget: NewProcedure1(),
        onContinueWidget: NewProcedure4(),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: <Widget>[
                const PageProgressBar(currentPageNumber: 2),
                const InputTextHeading(
                  title: 'Datei hochladen',
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 20,
                    bottom: 30,
                  ),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Hinweise: \nHier können Sie Dokumente zu Ihrem \nVolksbegehren hochladen. Dies können Sie auch\nspäter noch tun.',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: documentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        documentList.elementAt(index).documentName,
                      ),
                      leading: const Icon(Icons.insert_drive_file_outlined),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Icon(Icons.remove_red_eye),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              size: 20.0,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              //ScaffoldMessenger.of(context)
                              //    .showSnackBar(SnackBar(
                              //  content: Text("Call delete Listtile"),
                              //));
                              delete(index);
                              setState(() {});
                              //   _onDeleteItemPressed(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.blue),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf'],
                    );
                    if (result == null) return;

                    //open single file
                    final file = result.files.first;

                    documentList.add(Document(file.name, file.path.toString()));
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                  label: const Text(
                    'DOKUMENT HOCHLADEN',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

class Document {
  Document(this.documentName, this.link);

  String documentName;
  String link;
}
