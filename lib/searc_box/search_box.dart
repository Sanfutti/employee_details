import 'dart:async';

import 'package:employee_direct/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List datavalue2 = [];
List userDetails = [];

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => new _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getUserDetails() async {
    var urls = "http://www.mocky.io/v2/5d565297300000680030a986";
    var responses = await http.get(
      Uri.parse(urls),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final responseJson = json.decode(responses.body);

    setState(() {
      datavalue2 = json.decode(responses.body);
      for (int i = 0; i < datavalue2.length; i++) {
        userDetails.add(datavalue2[i]['name']);
        _userDetails.add(userDetails[i]);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xffccdce9),
                  Color(0xfff5f9fc),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 35.sp),
            child: new Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: new Card(
                child: new ListTile(
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: controller,
                    decoration: new InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetail(
                                        i: i,
                                      )));
                        },
                        child: new Card(
                          child: new ListTile(
                            title: new Text('${_searchResult[i]}'),
                          ),
                          margin: EdgeInsets.all(0.0.sp),
                        ),
                      );
                    },
                  )
                : new ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetail(
                                        i: index,
                                      )));
                        },
                        child: new Card(
                          child: new ListTile(
                            title: new Text(_userDetails[index] +
                                ' ' +
                                _userDetails[index]),
                          ),
                          margin: EdgeInsets.all(0.0.sp),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      if (userDetail.contains(text) || userDetail.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {});
  }
}

List<String> _searchResult = [];

List _userDetails = [];

final String url = 'https://jsonplaceholder.typicode.com/users';

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.profileUrl =
          'https://i.amz.mshcdn.com/3NbrfEiECotKyhcUhgPJHbrL7zM=/950x534/filters:quality(90.sp)/2014%2F06%2F02%2Fc0%2Fzuckheadsho.a33d0.jpg'});

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return new UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
