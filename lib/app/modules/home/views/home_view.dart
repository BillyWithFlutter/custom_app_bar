import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/CustomAppBar.dart';
import '../../../utils/dummy_scroll_item.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DummyScrollItem(),
          ],
        ),
      ),
    );
  }
}
