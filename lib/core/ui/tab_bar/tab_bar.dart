import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ojos_app/core/res/app_assets.dart';
import 'package:ojos_app/core/res/global_color.dart';
import 'package:ojos_app/core/res/text_style.dart';
import 'package:ojos_app/features/order/presentation/pages/attripute.dart';

class TabBarDemo extends StatefulWidget {
  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: globalColor.appBar,
          brightness: Brightness.light,
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'ادخل مقاسك',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'اطلب الخياط',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'صورة الفاتورة',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            "طلب اون لاين",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            OrderAttribute(),
            OutlineButton(
            borderSide: BorderSide(
              width: .5,
              color: Colors.black,
              style:
              BorderStyle.solid,
            ),
            shape:
            RoundedRectangleBorder(
                borderRadius:
                BorderRadius
                    .circular(
                    8)),
            onPressed: () {
              launchWhatsApp(
                  phone:
                  "+966555845631",
                  message:
                  "مرحبا اريد تفصيل ثوب");
            },
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment
                  .center,
              children: [
                Text(
                  ' اضغط ',
                  style: textStyle
                      .middleTSBasic
                      .copyWith(
                    fontSize: 18,
                    color:
                    globalColor
                        .black,
                    fontWeight:
                    FontWeight
                        .bold,
                  ),
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/images/icons/png/whats.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(width: 4),
                Text(
                  ' هنا ',
                  style: textStyle
                      .middleTSBasic
                      .copyWith(
                    fontSize: 18,
                    color:
                    globalColor
                        .black,
                    fontWeight:
                    FontWeight
                        .bold,
                  ),
                ),
              ],
            ),
          ),
            Icon(Icons.camera, size: 200),
          ],
        ),
      ),
    );
  }
}
void launchWhatsApp({
  required String phone,
  required String message,
}) async {
  String url() {
    if (Platform.isAndroid) {
      return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
    } else {
      // add the [https]
      return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(
          message)}"; // new line
    }
  }
}