import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView.separated Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView.separated Example'),
        ),
        body: ListView.separated(
          itemCount: 10, // 列表项数量
          itemBuilder: (context, index) {
            // 构建列表项
            return ListTile(
              title: Text('Item $index'),
            );
          },
          separatorBuilder: (context, index) {
            // 构建分隔符
            return Divider();
          },
        ),
      ),
    );
  }
}
