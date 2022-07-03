import 'package:feelings_tracker/app/modules/FeelingsHistory/components/30DaysFeelings.dart';
import 'package:feelings_tracker/app/modules/FeelingsHistory/components/selectedDateHistory.dart';
import 'package:feelings_tracker/app/modules/FeelingsHistory/components/youMayFindSomethingInteresting.dart';
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: LastThirtyDaysFeelings(),
            ),
            const Divider(
              color: Colors.black26,
              thickness: 0.5,
            ),
            SelectedDateHistory(),
            const Divider(
              color: Colors.black26,
              thickness: 0.5,
            ),
            Padding(
              padding: EdgeInsets.all(22.0),
              child: YouMayFindSomethingInteresting(),
            )
          ],
        ),
      ),
    );
  }
}
