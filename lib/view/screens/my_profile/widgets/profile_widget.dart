import 'package:flutter/material.dart';
import 'package:open_astro/core/font/app_font.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';

import '../../../../service/image_provider.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      //profile image
      leading: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: AppImageProvider.asset(asset: 'user4', height: 53, width: 53),
        ),
      ),
      //name
      title: Text("Jayanta", style: appText(size: 17, weight: FontWeight.w600)),
      //specilizations
      subtitle: Text(
        "Vedik| Hjkncj",
        style: appText(size: 12, weight: FontWeight.w400),
      ),
      //follower & reels
      trailing: SizedBox(
        width: percentWidth(percent: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("100+", style: appText(size: 14, weight: FontWeight.w600)),
                Text("Tips", style: appText(size: 10, weight: FontWeight.w400)),
              ],
            ),
            Column(
              children: [
                Text("10k", style: appText(size: 14, weight: FontWeight.w600)),
                Text(
                  "Followers",
                  style: appText(size: 10, weight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.s,
    //   crossAxisAlignment: CrossAxisAlignment.center,
    //   children: [
    //     ClipRRect(
    //       borderRadius: BorderRadius.circular(100),
    //       child: AppImageProvider.asset(asset: 'user4', height: 53, width: 53),
    //     ),
    //     Column(
    //       children: [
    //         Text(
    //           "Astrologer Name",
    //           style: appText(size: 17, weight: FontWeight.w600),
    //         ),
    //         Text(
    //           "Astrologer Specialization",
    //           style: appText(size: 12, weight: FontWeight.w400),
    //         ),
    //       ],
    //     ),
    //     Column(
    //       children: [
    //         Text("40", style: appText(size: 14, weight: FontWeight.w600)),
    //         Text("Reels", style: appText(size: 10, weight: FontWeight.w400)),
    //       ],
    //     ),
    //     Column(
    //       children: [
    //         Text("46.3k", style: appText(size: 14, weight: FontWeight.w600)),
    //         Text(
    //           "Followers",
    //           style: appText(size: 10, weight: FontWeight.w400),
    //         ),
    //       ],
    //     ),
    //   ],
    // );
  }
}
