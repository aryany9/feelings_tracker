import 'package:get/get.dart';

import '../controllers/dummypage2_controller.dart';

class Dummypage2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dummypage2Controller>(
      () => Dummypage2Controller(),
    );
  }
}
