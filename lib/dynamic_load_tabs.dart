import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 应用的起点
void main() {
  runApp(GetMaterialApp(
    home: DynamicTabBarExample(),
  ));
}

class DynamicTabBarExample extends StatefulWidget {
  const DynamicTabBarExample({Key? key}) : super(key: key);

  @override
  State<DynamicTabBarExample> createState() => _DynamicTabBarExampleState();
}

class _DynamicTabBarExampleState extends State<DynamicTabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabCount = 0; // 初始 Tab 数量
  List<String> _tabNames = []; // Tab 的名称列表

  @override
  void initState() {
    super.initState();
    _loadData(); // 加载数据并初始化 TabController
  }

  Future<void> _loadData() async {
    // 模拟异步加载数据
    await Future.delayed(const Duration(seconds: 2));

    // 获取 Tab 的名称列表
    _tabNames = ['Tab 1', 'Tab 2', 'Tab 3', 'Tab 4'];
    _tabCount = _tabNames.length;

    // 初始化 TabController
    _tabController = TabController(length: _tabCount, vsync: this);

    setState(() {}); // 更新 UI
  }

  @override
  void dispose() {
    _tabController.dispose(); // 释放 TabController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic TabBar Example'),
        bottom: _tabCount > 0
            ? TabBar(
                controller: _tabController,
                isScrollable: true, // 允许 TabBar 滚动
                tabs: _tabNames
                    .map((name) => Tab(text: name))
                    .toList(), // 根据名称列表创建 Tab
              )
            : null, // 如果 Tab 数量为 0，则不显示 TabBar
      ),
      body: _tabCount > 0
          ? TabBarView(
              controller: _tabController,
              children: _tabNames
                  .map((name) => Center(child: Text('Content of $name')))
                  .toList(), // 根据名称列表创建 TabBarView 的内容
            )
          : const Center(
              child: CircularProgressIndicator()), // 如果 Tab 数量为 0，则显示加载指示器
    );
  }
}
