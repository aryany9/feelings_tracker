import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dummypage2_controller.dart';

class Dummypage2View extends GetView<Dummypage2Controller> {
  const Dummypage2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummypage2View'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Dummypage2View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
