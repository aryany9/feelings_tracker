import 'dart:convert';

import 'package:feelings_tracker/app/data/constants/const.dart';
import 'package:feelings_tracker/app/modules/FeelingsHistory/models/listOfFeelingsModel.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<dynamic> getUserFeelingList(String selectedDate) async {
    final response = await post(baseUrl + 'getListOfUserFeeling',
        {'user_id': userId, 'feeling_date': '15-04-2022'},
        headers: {authToken: authKey});
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      var result = jsonDecode(response.body);
      debugPrint(result);
      return ListOfUserFeelingsModel.fromJson(result);
    }
  }
}
