import 'package:flutter/material.dart';
import 'package:flutter_dart_test_last/log_util.dart';
import 'package:get/get.dart';

import '../controller.dart';

class Third extends StatelessWidget {
  // 他怎么知道是这个controller, 这些靠谱一点
  final Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    myPrint(' Third build ....');
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          controller.incrementList();
        }),
        appBar: AppBar(
          title: Text("Third ${Get.arguments}"),
        ),
        body: Obx(() => ListView.builder(
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              myPrint('item index = $index');
              return GestureDetector(
                onTap: () {
                  myPrint('click index = $index');
                  controller.updateItem(controller.list[index]);
                },
                child: Container(
                    color: index % 2 == 0 ? Colors.redAccent : Colors.blue,
                    width: double.infinity,
                    height: 200,
                    child: Text(controller.list[index].toString())),
              );
            })));
  }
}
