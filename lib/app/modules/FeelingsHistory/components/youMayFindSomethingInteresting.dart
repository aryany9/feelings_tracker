import 'package:feelings_tracker/app/modules/FeelingsHistory/controllers/feelings_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouMayFindSomethingInteresting extends StatelessWidget {
  YouMayFindSomethingInteresting({Key? key}) : super(key: key);

  final FeelingsHistoryController _controller =
      Get.find<FeelingsHistoryController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          "You May Find Something Interesting",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Obx(() => _controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _controller.model.value!.data!.videoArr!.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _controller.model.value?.data?.videoArr?[index]
                                    .title ??
                                "Title",
                            // style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            _controller.model.value?.data?.videoArr?[index]
                                    .description ??
                                'Description',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width - 100,
                              height: 160,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  10.0,
                                ),
                                child: _controller.model.value?.data
                                            ?.videoArr?[index].youtubeUrl !=
                                        null
                                    ? YoutubePlayer(
                                        controller: YoutubePlayerController(
                                            initialVideoId:
                                                YoutubePlayer.convertUrlToId(
                                                    _controller
                                                        .model
                                                        .value!
                                                        .data!
                                                        .videoArr![index]
                                                        .youtubeUrl!)!,
                                            flags: const YoutubePlayerFlags(
                                              autoPlay: false,
                                              mute: true,
                                            )),
                                        bottomActions: [
                                          CurrentPosition(),
                                          ProgressBar(isExpanded: true),
                                        ],
                                        showVideoProgressIndicator: true,
                                      )
                                    : const SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: _controller.model.value?.data?.videoArr?.length,
                  )
                : const SizedBox()),
        // Text(_controller.model.value.data.videoArr)
      ],
    );
  }
}
