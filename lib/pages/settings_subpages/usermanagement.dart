import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage_for_admin.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

TextEditingController controller = TextEditingController();

class UserScreen extends StatefulWidget {
  const UserScreen(this.service, {Key? key}) : super(key: key);
  final ServiceDataBase service;
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    getUserDetails();
    _userDetails.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Benutzerverwaltung'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Suche',
                    border: InputBorder.none,
                  ),
                  onChanged: onSearchTextChanged,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                ? ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: EdgeInsets.zero,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            '${_searchResult[i].firstName} ${_searchResult[i].lastName}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePageForAdmin(
                                  _searchResult[i],
                                  widget.service,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.zero,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Text(
                            '${_userDetails[index].firstName} ${_userDetails[index].lastName}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePageForAdmin(
                                  _userDetails[index],
                                  widget.service,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Get json result and convert it to model. Then add
  Future<void> getUserDetails() async {
    setState(() async {
      ServiceDataBase().init();
      _userDetails = (await ServiceDataBase().getAllUsers())!;
    });
  }

  Future<void> onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (final userDetail in _userDetails) {
      if (userDetail.firstName.contains(text) ||
          userDetail.lastName.contains(text)) {
        _searchResult.add(userDetail);
      }
    }
    setState(() {});
  }
}

List<User> _searchResult = [];

List<User> _userDetails = [];
