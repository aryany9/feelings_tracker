import 'package:feelings_tracker/app/data/services/api_services.dart';
import 'package:feelings_tracker/app/modules/FeelingsHistory/models/listOfFeelingsModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FeelingsHistoryController extends GetxController {
  RxList<Map> feelingsHistory = [
    {
      0: {
        'percentage': "0",
        'name': 'Energetic',
        'emojiPath': 'assets/emojis/energetic.png',
      }
    },
    {
      1: {
        'percentage': "0",
        'name': 'Sad',
        'emojiPath': 'assets/emojis/sad.png',
      }
    },
    {
      2: {
        'percentage': "0",
        'name': 'Happy',
        'emojiPath': 'assets/emojis/happy.png',
      }
    },
    {
      3: {
        'percentage': "0",
        'name': 'Angry',
        'emojiPath': 'assets/emojis/angry.png',
      }
    },
    {
      4: {
        'percentage': "0",
        'name': 'Calm',
        'emojiPath': 'assets/emojis/calm.png',
      }
    },
    {
      5: {
        'percentage': "0",
        'name': 'Bored',
        'emojiPath': 'assets/emojis/bored.png',
      }
    },
    {
      6: {
        'percentage': "0",
        'name': 'Love',
        'emojiPath': 'assets/emojis/love.png',
      }
    }
  ].obs;
  RxList<DateTime> dates = RxList<DateTime>();
  Rx<DateTime> selectedDate = Rx(DateTime.now());
  RxString formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now()).obs;
  RxBool isLoading = true.obs;
  Rxn<ListOfUserFeelingsModel> model = Rxn<ListOfUserFeelingsModel>();

  final count = 0.obs;
  @override
  void onInit() {
    getListofUserFeeling(selectedDate.toString());
    storeDate();
    super.onInit();
  }

  void storeDate() {
    dates = <DateTime>[].obs;
    for (int i = 0; i <= 30; i++) {
      var nextDate = DateTime.now().add(Duration(days: -i));
      dates.add(DateTime(nextDate.year, nextDate.month, nextDate.day));
    }
  }

  String getEmojiPath(String feelingId) {
    int index = feelingsHistory
        .indexWhere((map) => map.containsKey(int.parse(feelingId)));
    return feelingsHistory[index].entries.first.value['emojiPath'];
  }

  storeEmojiPercentage(
      {required String feelingName, required String percentage}) async {
    for (var element in feelingsHistory) {
      if (element.entries.first.value['name'].toString().toLowerCase() ==
          feelingName.toLowerCase()) {
        element.entries.first.value['percentage'] = percentage;
        feelingsHistory.value = feelingsHistory.value;
      }
    }
  }

  Future<void> getListofUserFeeling(String selectedDate) async {
    isLoading(true);
    print(selectedDate);
    model.value = null;
    model.value = await Provider().getUserFeelingList(selectedDate);
    model.value?.data?.feelingPercentage?.toJson().entries.forEach((element) {
      storeEmojiPercentage(feelingName: element.key, percentage: element.value);
    });
    isLoading(false);
  }

  void increment() => count.value++;
}
