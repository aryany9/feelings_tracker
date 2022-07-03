import 'package:feelings_tracker/app/modules/FeelingsHistory/controllers/feelings_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SelectedDateHistory extends StatelessWidget {
  SelectedDateHistory({Key? key}) : super(key: key);
  final FeelingsHistoryController _controller =
      Get.find<FeelingsHistoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffC6E5F7),
                ),
                padding: const EdgeInsets.all(5),

                // child: Text("10 Jun, 2021",
                child: Obx(() => Text(
                      DateFormat('dd MMM, yyyy')
                          .format(_controller.selectedDate.value),
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
                    )),
              ),
              const SizedBox(height: 20),
              Obx(
                () => SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: _controller.dates.length,
                    itemBuilder: (BuildContext context, int index) => InkWell(
                      onTap: () {
                        _controller.selectedDate.value =
                            _controller.dates[index];

                        _controller.formattedDate.value =
                            DateFormat('dd-MM-yyyy')
                                .format(_controller.dates[index]);
                        _controller.getListofUserFeeling(
                            _controller.formattedDate.value);
                      },
                      child: Obx(() => Container(
                            decoration: BoxDecoration(
                              color: DateFormat('dd-MM-yyyy')
                                          .format(_controller.dates[index])
                                          .toString() ==
                                      _controller.formattedDate.value
                                  ? const Color(0xFF4F4F4F)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            width: 55,
                            alignment: Alignment.center,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10),
                                Text(
                                  DateFormat('EE')
                                      .format(_controller.dates[index]),
                                  style: const TextStyle(
                                    color: Color(0xFFA7A7A7),
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  _controller.dates[index].day.toString(),
                                  style: TextStyle(
                                    color: DateFormat('dd-MM-yyyy')
                                                .format(
                                                    _controller.dates[index])
                                                .toString() ==
                                            _controller.formattedDate.value
                                        ? const Color(0xFFf1f2f3)
                                        : const Color(0xFF121212),
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(width: 15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        const Divider(
          color: Colors.black26,
          thickness: 0.5,
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Obx(
            () => _controller.model.value == null
                ? const SizedBox()
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        _controller.model.value!.data!.feelingList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                // flex: 5,
                                width: 90,
                                alignment: Alignment.center,
                                child: Text(
                                    DateFormat('hh:ss a')
                                        .format(_controller.model.value!.data!
                                            .feelingList![index].submitTime!)
                                        .toString(),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    )),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Image.asset(
                                _controller.getEmojiPath(_controller
                                    .model
                                    .value!
                                    .data!
                                    .feelingList![index]
                                    .feelingId!),
                                height: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                flex: 5,
                                child: Text(
                                    _controller.model.value!.data!
                                        .feelingList![index].feelingName!,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
