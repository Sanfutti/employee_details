import 'dart:convert';

import 'package:employee_direct/searc_box/search_box.dart';
import 'package:employee_direct/user_details/user_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:http/http.dart' as http;

List datavalue2 = [];
List images = [];

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
      // print(" hello :${datavalue2}");
      // for (int i = 0; i < datavalue2.length; i++) {
      //   if (datavalue2[i]['profile_image'] != null) {
      //     images.add(datavalue2[i]['profile_image']);
      //   }
      //   else if (datavalue2[i]['profile_image'] == null) {
      //     images.add(datavalue2[i]['profile_image']);
      //     print(" noImage :${datavalue2[i]['name']}");
      //   }
      //   print(" Image :${images}");
      // }
    });
  }

  @override
  void initState() {
    dataval2();

    super.initState();
  }

  double _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: datavalue2.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
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
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: Container(
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 9.sp),
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        enableFeedback: false,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.menu,
                                          color: Color(0xff464a6a),
                                          size: 35,
                                        ),
                                      ),
                                      Text(
                                        'Employee direct',
                                        style: TextStyle(
                                            fontSize: 22.sp,
                                            color: Color(0xff1b1f34),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      IconButton(
                                        enableFeedback: false,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SearchBox()));
                                        },
                                        icon: const Icon(
                                          Icons.search,
                                          color: Color(0xff464a6a),
                                          size: 35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 25.sp,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.sp),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 60.sp,
                                              width: 60.sp,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              60.0.sp))),
                                              child: IconButton(
                                                enableFeedback: false,
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.work_outline,
                                                  color: Color(0xff464a6a),
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            Text(
                                              'Work',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 60.sp,
                                              width: 60.sp,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              60.0.sp))),
                                              child: IconButton(
                                                enableFeedback: false,
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.assignment,
                                                  color: Color(0xff464a6a),
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            Text(
                                              'Reports',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 60.sp,
                                              width: 60.sp,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              60.0.sp))),
                                              child: IconButton(
                                                enableFeedback: false,
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.person_add,
                                                  color: Color(0xff464a6a),
                                                  size: 35,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.sp,
                                            ),
                                            Text(
                                              'Add',
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      for (int i = 0; i < datavalue2.length; i++) GetPop(i)
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  GetPop(int i) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetail(
                      i: i,
                    )));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 9.sp,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 75.sp,
                      width: 75.sp,
                      child: datavalue2[i]['profile_image'] != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(55.0.sp),
                              child: Image.network(
                                "${datavalue2[i]['profile_image']}",
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.asset(
                              "assets/images/userIcon.png",
                            ),
                    ),
                    Container(
                      // padding: EdgeInsets.only(left: 25.sp),
                      child: Container(
                        // color: Colors.red,
                        width: 240.sp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${datavalue2[i]['name']}',
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '${datavalue2[i]['email']}',
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.sp,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Company',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 3.sp,
                                    ),
                                    Text(
                                      'stepup models',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //  Image.asset("assets/images/imageforswim.jpg",),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
