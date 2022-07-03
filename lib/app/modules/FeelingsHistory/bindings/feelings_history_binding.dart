import 'package:get/get.dart';

import '../controllers/feelings_history_controller.dart';

class FeelingsHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeelingsHistoryController>(
      () => FeelingsHistoryController(),
    );
  }
}
