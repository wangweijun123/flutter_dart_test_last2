import 'package:flutter/cupertino.dart';
import 'package:flutter_dart_test_last/widget/t_image.dart';

import '../gen/assets.gen.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  State<ImagePickerPage> createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: TImage(
            Assets.image.defaultPhoto.path,
          ),
          onTap: () {},
        ),
        Text("更换背景"),
      ],
    );
  }
}
