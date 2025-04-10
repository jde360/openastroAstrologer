import 'package:flutter/material.dart';
import 'package:open_astro/service/svg_provider.dart';

import '../../../../controller/astrologer_profile_controller.dart';
import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';
import '../../../../service/image_provider.dart';
import '../../../widgets/space.dart';
import 'package:get/get.dart';

class FeaturedWidget extends StatelessWidget {
  FeaturedWidget({super.key});

  final AstrologerProfileController _astrologerProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    final featuredImage =
        _astrologerProfileController.astrologerProfileData.value.featuredImage;
    final featuredVideo =
        _astrologerProfileController.astrologerProfileData.value.featuredVideo;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Featured', style: appText(size: 18, weight: FontWeight.w600)),
        space(height: 5, width: 0),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 11,
            runSpacing: 11,
            children: [
              Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                  color: AppColor().primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                    featuredImage == null
                        ? Padding(
                          padding: const EdgeInsets.all(80.0),
                          child: SvgProvider.asset(
                            asset: 'image_upload',
                            color: AppColor().bg,
                          ),
                        )
                        : AppImageProvider.network(
                          195,
                          195,
                          url: featuredImage,
                        ),
              ),
              Container(
                height: 190,
                width: 190,
                decoration: BoxDecoration(
                  color: AppColor().primary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child:
                    featuredVideo != null
                        ? Padding(
                          padding: const EdgeInsets.all(78.0),
                          child: SvgProvider.asset(
                            asset: 'video_upload',
                            color: AppColor().bg,
                          ),
                        )
                        // ? AppImageProvider.network(195, 195, url: featuredImage)
                        : Padding(
                          padding: const EdgeInsets.all(78.0),
                          child: SvgProvider.asset(
                            asset: 'video_upload',
                            color: AppColor().bg,
                          ),
                        ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
