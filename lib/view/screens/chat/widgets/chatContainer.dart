import 'package:flutter/material.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';
import 'package:open_astro/view/widgets/space.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';
import '../../../../service/time_formater.dart';

class ChatContainer extends StatelessWidget {
  final bool isSender;
  final String message;
  final String time;

  const ChatContainer({
    super.key,
    required this.isSender,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Container(
                // width: percentWidth(percent: 70),
                constraints: BoxConstraints(
                  maxWidth: percentWidth(percent: 70),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                decoration: BoxDecoration(
                  color:
                      isSender
                          ? Colors.white.withOpacity(0.1)
                          : AppColor().primary.withOpacity(0.2),
                  borderRadius:
                      isSender
                          ? const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          )
                          : const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                ),
                child: Column(
                  crossAxisAlignment:
                      isSender
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: appText(
                        size: 13,
                        weight: FontWeight.w400,
                        color: isSender ? Colors.white : AppColor().chatColor,
                      ),
                    ),
                    space(height: 2, width: 0),
                    Text(
                      AppFormatedTime.formatTime(time),
                      textAlign: TextAlign.end,
                      style: appText(
                        size: 7,
                        weight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
