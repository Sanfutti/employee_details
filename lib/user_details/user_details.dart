import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:http/http.dart' as http;

class UserDetail extends StatefulWidget {
  int i;
  UserDetail({Key? key, required this.i}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserDetailState();
  }
}

class _UserDetailState extends State<UserDetail> {
  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  List datavalue2 = [];
  dataval2() async {
    var urls = "http://www.mocky.io/v2/5d565297300000680030a986";

    var responses = await http.get(
      Uri.parse(urls),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    setState(() {
      datavalue2 = json.decode(responses.body);
      print(" hello :${datavalue2}");
    });
  }

  @override
  void initState() {
    dataval2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: datavalue2.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.sp),
                child: Column(
                  children: [
                    //Container(height: 100.sp, child: HeaderWidget(100.sp,false,Icons.house_rounded),),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        enableFeedback: false,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Color(0xff464a6a),
                          size: 35,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(25, 10.sp, 25, 10),
                      //  padding: EdgeInsets.fromLTRB(10.sp, 0.sp, 10.sp, 0),
                      child: Column(
                        children: [
                          Container(
                            //padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              // border: Border.all(width: 5, color: Colors.white),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20.sp,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(55.0.sp),
                              child: Image.network(
                                "${datavalue2[widget.i]['profile_image']}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Text(
                            '${datavalue2[widget.i]['name']}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.sp,
                          ),
                          Text(
                            '${datavalue2[widget.i]['username']}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 35.sp,
                                ),
                                Container(
                                  // padding:
                                  //     const EdgeInsets.only(left: 8.0.sp, bottom: 4.0),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "User Information",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.sp,
                                ),
                                Card(
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    //  padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            ...ListTile.divideTiles(
                                              color: Colors.grey,
                                              tiles: [
                                                ListTile(
                                                  leading: Icon(Icons.email),
                                                  title: Text("Email"),
                                                  subtitle: Text(
                                                      "${datavalue2[widget.i]['email']}"),
                                                ),
                                                ListTile(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12.sp,
                                                          vertical: 4.sp),
                                                  leading:
                                                      Icon(Icons.my_location),
                                                  title: Text("Address"),
                                                  subtitle: Text(
                                                      "${datavalue2[widget.i]['address']['street']},${datavalue2[widget.i]['address']['suite']},${datavalue2[widget.i]['address']['city']},\nZipcode : ${datavalue2[widget.i]['address']['zipcode']}"),
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.phone),
                                                  title: Text("Phone"),
                                                  subtitle: Text(datavalue2[
                                                                  widget.i]
                                                              ['phone'] ==
                                                          null
                                                      ? "010-658-6991"
                                                      : "${datavalue2[widget.i]['phone']}"),
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.tv),
                                                  title: Text("Website"),
                                                  subtitle: Text(
                                                      "${datavalue2[widget.i]['website']}"),
                                                ),
                                                ListTile(
                                                  leading: Icon(Icons.phone),
                                                  title: Text("Company"),
                                                  subtitle: Text(
                                                      "${datavalue2[widget.i]['company']['name']}"),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
