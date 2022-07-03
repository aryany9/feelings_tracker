import 'package:feelings_tracker/app/modules/FeelingsHistory/controllers/feelings_history_controller.dart';
import 'package:feelings_tracker/app/modules/FeelingsHistory/widgets/emojibar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LastThirtyDaysFeelings extends StatelessWidget {
  LastThirtyDaysFeelings({Key? key}) : super(key: key);
  final FeelingsHistoryController _controller =
      Get.find<FeelingsHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "Your feelings from last 30 days",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 160,
          child: Obx(
            () => ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: _controller.feelingsHistory.value.length,
              itemBuilder: (BuildContext context, int index) {
                return Opacity(
                  opacity: _controller.feelingsHistory.value[index].entries
                              .first.value['percentage'] !=
                          "0"
                      ? 1
                      : 0.5,
                  child: FeelingsBarWidget(
                    percentage: _controller.feelingsHistory.value[index].entries
                        .first.value['percentage'],
                    emojiPath: _controller.feelingsHistory.value[index].entries
                        .first.value['emojiPath'],
                    emojiName: _controller.feelingsHistory.value[index].entries
                        .first.value['name'],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 15);
              },
            ),
          ),
        ),
      ],
    );
  }
}
