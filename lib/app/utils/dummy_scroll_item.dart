import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DummyScrollItem extends StatelessWidget {
  const DummyScrollItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
        ),
        Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.purple,
          ),
        ),
        Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.green,
          ),
        ),
        Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
        ),
        Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        Container(
          height: 200,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.pink,
          ),
        ),
      ],
    );
  }
}
