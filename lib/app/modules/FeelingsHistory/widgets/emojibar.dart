import 'package:feelings_tracker/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeelingsBarWidget extends StatelessWidget {
  String percentage;
  String emojiPath;
  String emojiName;

  FeelingsBarWidget({
    Key? key,
    required this.percentage,
    required this.emojiPath,
    required this.emojiName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          // elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50.0,
            ),
          ),
          // color: itemBackgroundColor,
          child: SizedBox(
            height: 130,
            width: 60,
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 60 / 2 - 18,
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "$percentage%",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: accentColor,
                    radius: 30.0,
                    child: Image.asset(
                      emojiPath,
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          emojiName,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
