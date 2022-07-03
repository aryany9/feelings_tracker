import 'package:feelings_tracker/app/modules/FeelingsHistory/models/listOfFeelingsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FeelingsHistoryController extends GetxController {
  List<Map> feelingsHistory = [
    {
      'id': 1,
      'name': 'Energetic',
      'emojiPath': 'assets/emojis/energetic.png',
    },
    {
      'id': 2,
      'name': 'Sad',
      'emojiPath': 'assets/emojis/sad.png',
    },
    {
      'id': 3,
      'name': 'Happy',
      'emojiPath': 'assets/emojis/happy.png',
    },
    {
      'id': 4,
      'name': 'Angry',
      'emojiPath': 'assets/emojis/angry.png',
    },
    {
      'id': 5,
      'name': 'Calm',
      'emojiPath': 'assets/emojis/calm.png',
    },
    {
      'id': 6,
      'name': 'Bored',
      'emojiPath': 'assets/emojis/bored.png',
    },
    {
      'id': 7,
      'name': 'Love',
      'emojiPath': 'assets/emojis/love.png',
    },
  ];
  Rxn<ListOfUserFeelingsModel> model = Rxn<ListOfUserFeelingsModel>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
