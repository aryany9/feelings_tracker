// To parse this JSON data, do
//
//     final listOfUserFeelingsModel = listOfUserFeelingsModelFromJson(jsonString);

import 'dart:convert';

ListOfUserFeelingsModel listOfUserFeelingsModelFromJson(String str) =>
    ListOfUserFeelingsModel.fromJson(json.decode(str));

String listOfUserFeelingsModelToJson(ListOfUserFeelingsModel data) =>
    json.encode(data.toJson());

class ListOfUserFeelingsModel {
  ListOfUserFeelingsModel({
    this.status,
    this.data,
  });

  String? status;
  Data? data;

  factory ListOfUserFeelingsModel.fromJson(Map<String, dynamic> json) =>
      ListOfUserFeelingsModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? null : data?.toJson(),
      };
}

class Data {
  Data({
    this.feelingPercentage,
    this.feelingList,
    this.videoArr,
  });

  FeelingPercentage? feelingPercentage;
  List<FeelingList>? feelingList;
  List<VideoArr>? videoArr;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        feelingPercentage: json["feeling_percentage"] == null
            ? null
            : FeelingPercentage.fromJson(json["feeling_percentage"]),
        feelingList: json["feeling_list"] == null
            ? null
            : List<FeelingList>.from(
                json["feeling_list"].map((x) => FeelingList.fromJson(x))),
        videoArr: json["video_arr"] == null
            ? null
            : List<VideoArr>.from(
                json["video_arr"].map((x) => VideoArr.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "feeling_percentage":
            feelingPercentage == null ? null : feelingPercentage?.toJson(),
        "feeling_list": feelingList == null
            ? null
            : List<dynamic>.from(feelingList!.map((x) => x.toJson())),
        "video_arr": videoArr == null
            ? null
            : List<dynamic>.from(videoArr!.map((x) => x.toJson())),
      };
}

class FeelingList {
  FeelingList({
    this.userFeelingId,
    this.feelingId,
    this.feelingName,
    this.submitTime,
  });

  String? userFeelingId;
  String? feelingId;
  String? feelingName;
  DateTime? submitTime;

  factory FeelingList.fromJson(Map<String, dynamic> json) => FeelingList(
        userFeelingId: json["user_feeling_id"],
        feelingId: json["feeling_id"],
        feelingName: json["feeling_name"],
        submitTime: json["submit_time"] == null
            ? null
            : DateTime.parse(json["submit_time"]),
      );

  Map<String, dynamic> toJson() => {
        "user_feeling_id": userFeelingId,
        "feeling_id": feelingId,
        "feeling_name": feelingName,
        "submit_time":
            submitTime == null ? null : submitTime?.toIso8601String(),
      };
}

class FeelingPercentage {
  FeelingPercentage({
    this.happy,
    this.sad,
    this.energetic,
    this.calm,
    this.angry,
    this.bored,
  });

  String? happy;
  String? sad;
  String? energetic;
  String? calm;
  String? angry;
  String? bored;

  factory FeelingPercentage.fromJson(Map<String, dynamic> json) =>
      FeelingPercentage(
        happy: json["Happy"],
        sad: json["Sad"],
        energetic: json["Energetic"],
        calm: json["Calm"],
        angry: json["Angry"],
        bored: json["Bored"],
      );

  Map<String, dynamic> toJson() => {
        "Happy": happy,
        "Sad": sad,
        "Energetic": energetic,
        "Calm": calm,
        "Angry": angry,
        "Bored": bored,
      };
}

class VideoArr {
  VideoArr({
    this.title,
    this.description,
    this.youtubeUrl,
  });

  String? title;
  String? description;
  String? youtubeUrl;

  factory VideoArr.fromJson(Map<String, dynamic> json) => VideoArr(
        title: json["title"],
        description: json["description"],
        youtubeUrl: json["youtube_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "youtube_url": youtubeUrl,
      };
}
