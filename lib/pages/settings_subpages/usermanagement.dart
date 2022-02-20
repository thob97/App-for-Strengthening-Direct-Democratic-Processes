import 'dart:async';

import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/settings_subpages/profilepage.dart';
import 'package:swp_direktdem_verf_app/service/model/user.dart';
import 'package:swp_direktdem_verf_app/service/service_mocked.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen(this.users, {Key? key}) : super(key: key);
  final List<User> users;
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController controller = TextEditingController();

  // Get json result and convert it to model. Then add
  Future<void> getUserDetails() async {
    setState(() async {
      _userDetails = await ServiceMocked().getAllUser();
    });
  }

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
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg',
                            ),
                          ),
                          title: Text(
                            '${_searchResult[i].first_name} ${_searchResult[i].last_name}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  _searchResult[i],
                                  widget.users,
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
                          leading: const CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://banner2.cleanpng.com/20180516/zq/kisspng-computer-icons-google-account-icon-design-login-5afc02dab4a218.0950785215264652427399.jpg',
                            ),
                          ),
                          title: Text(
                            '${_userDetails[index].first_name} ${_userDetails[index].last_name}',
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(
                                  _userDetails[index],
                                  widget.users,
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

  Future<void> onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    for (final userDetail in _userDetails) {
      if (userDetail.first_name.contains(text) ||
          userDetail.last_name.contains(text)) {
        _searchResult.add(userDetail);
      }
    }
    setState(() {});
  }
}

List<User> _searchResult = [];

List<User> _userDetails = [];
