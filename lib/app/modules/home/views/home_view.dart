import 'package:feelings_tracker/app/routes/app_pages.dart';
import 'package:feelings_tracker/app/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: MaterialButton(
          color: accentColor,
          onPressed: () {
            Get.toNamed(Routes.FEELINGS_HISTORY);
          },
          child: const Text(
            'Check Feelings History',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
