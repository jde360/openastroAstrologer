import 'package:flutter/material.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';

class ChatContainer extends StatelessWidget {
  final bool isSender;
  const ChatContainer({super.key, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.bottomRight : Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                width: percentWidth(percent: 70),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color:
                      isSender
                          ? Colors.white.withOpacity(0.1)
                          : AppColor().primary.withOpacity(0.2),
                  borderRadius:
                      isSender
                          ? const BorderRadius.only(
                            topLeft: Radius.circular(13.0),
                            topRight: Radius.circular(13.0),
                            bottomLeft: Radius.circular(13.0),
                          )
                          : const BorderRadius.only(
                            topLeft: Radius.circular(13.0),
                            topRight: Radius.circular(13.0),
                            bottomRight: Radius.circular(13.0),
                          ),
                ),
                child: Text(
                  'Lorem Ipsum has been the industrys to standard dummy text ever since the',
                  style: appText(
                    size: 13,
                    weight: FontWeight.w400,
                    color: isSender ? Colors.white : AppColor().chatColor,
                  ),
                ),
              ),
            ),
            Text(
              '4:34 PM',
              style: appText(
                size: 12,
                weight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
