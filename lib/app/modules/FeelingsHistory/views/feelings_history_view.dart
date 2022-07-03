import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feelings_history_controller.dart';

class FeelingsHistoryView extends GetView<FeelingsHistoryController> {
  const FeelingsHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Feelings History'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FeelingsHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
