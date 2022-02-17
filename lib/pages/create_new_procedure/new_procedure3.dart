import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure1.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure4.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  primary: const Color(0xFF194C76),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewProcedure1(),
                    ),
                  );
                },
                child: const Text(
                  'ZURÜCK',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewProcedure4(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  primary: const Color(0xFF194C76),
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'WEITER',
                  style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 2.2,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 10, top: 10),
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('1'),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 80.0,
                        color: Colors.black,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('2'),
                        ),
                      ),
                      Container(
                        height: 1.0,
                        width: 80.0,
                        color: Colors.black,
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: const Text('3'),
                        ),
                      ),
                    ],
                  ),),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    padding: const EdgeInsets.only(right: 10, top: 10),
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                    ),
                    child: const Text(
                      'Datei hochladen',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
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
