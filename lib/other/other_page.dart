import 'package:flutter/material.dart';
import 'package:flutter_dart_test_last/log_util.dart';
import 'package:get/get.dart';

import '../home/home_page_controller.dart';

class OtherPage extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final HomePageController c = Get.find();

  @override
  Widget build(context) {
    // 与在首页放进去后返回的对象是同一个，所以数据一致
    myPrint("OtherPage build = ${c.hashCode}");
    // Access the updated count variable

    return Scaffold(
        appBar: AppBar(
          title: const Text('不同页面共享数据'),
        ),
        body: Center(child: Text("${c.count}")));
  }
}
