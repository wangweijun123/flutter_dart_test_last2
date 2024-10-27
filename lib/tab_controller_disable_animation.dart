import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dart_test_last/log_util.dart';
import 'package:flutter_dart_test_last/multi_test.dart';
import 'package:get/get.dart';

import 'jike/eventbus/pass_param_to_child.dart';
import 'other/other_page.dart';
import 'home/home_page_controller.dart';

// 应用的起点
void main() {
  runApp(GetMaterialApp(
    home: DisableTabBarAnimationExample(),
  ));
}

class DisableTabBarAnimationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Disable TabBar Animation'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // 禁用滑动
          children: [
            Center(child: Text('Tab 1 Content')),
            Center(child: Text('Tab 2 Content')),
            Center(child: Text('Tab 3 Content')),
          ],
        ),
      ),
    );
  }
}

class MyDefaultTabController extends StatefulWidget {
  const MyDefaultTabController({
    Key? key,
    required this.length,
    this.initialIndex = 0,
    required this.child,
  }) : super(key: key);

  final int length;
  final int initialIndex;
  final Widget child;

  @override
  State<MyDefaultTabController> createState() => _MyDefaultTabControllerState();
}

class _MyDefaultTabControllerState extends State<MyDefaultTabController>
    with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      length: widget.length,
      initialIndex: widget.initialIndex,
      animationDuration: Duration.zero,
    );
    // _controller?.animationDuration = Duration.zero;
    // _controller?.animationDuration = Duration.zero;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _TabControllerScope(
      controller: _controller!,
      enabled: TickerMode.of(context),
      child: widget.child,
    );
  }
}

class _TabControllerScope extends InheritedWidget {
  const _TabControllerScope({
    Key? key,
    required this.controller,
    required this.enabled,
    required Widget child,
  }) : super(key: key, child: child);

  final TabController controller;
  final bool enabled;

  @override
  bool updateShouldNotify(_TabControllerScope old) {
    return enabled != old.enabled || controller != old.controller;
  }
}
