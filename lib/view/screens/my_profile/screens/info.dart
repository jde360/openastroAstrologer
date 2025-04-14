import 'package:flutter/material.dart';
import 'package:open_astro/view/screens/my_profile/screens/review.dart';
import 'package:open_astro/view/screens/my_profile/widgets/specialization_card.dart';

import '../../../../controller/astrologer_profile_controller.dart';
import '../../../../core/font/app_font.dart';
import '../../../widgets/space.dart';
import '../../navigation/widgets/video_card_widget.dart';
import '../widgets/featured.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({super.key});

  final AstrologerProfileController _astrologerProfileController = Get.find();

  final String thumbnail =
      'https://s3-alpha-sig.figma.com/img/b283/5891/58f870bf0940aff3e099b3032c91587d?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JiuoeaI22vXTc0nslszquZERj00Jc5zQuoVEeimOzFyqDEOhUI31~fdl9FZgQJSkrsnXOPd9Ign0Htmdkjq4odIDZSHrNEm9v9cGH2pcjJ72mP9LLh24o9e6rttIeZvXBBvNijQzW-su-eYpJjbAECc4Be-LSEmBn6dHtbqgargaYfr~uLWO~z0eMY5QD69Pgdr04bopNS-biJjdPBAr4dnjvvPK9LqQdUnwH5QFAmL1R8u3j6pPMSeXGSkCAFH~6VyCyHyRfVFSK4fwrnE-UThp5C6uB-kda7iyGheCDoyOEU-LAfslYPD3O-U0unq-HIDOcUvhvTMh2-NH7MWIYg__';

  @override
  Widget build(BuildContext context) {
    final specializations =
        _astrologerProfileController
            .astrologerProfileData
            .value
            .astroProfile
            ?.specializations;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          space(height: 21, width: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Specialization',
                style: appText(size: 18, weight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
                width: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.all(0),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Get.toNamed('/edit-profile');
                  },
                  child: Text(
                    "Edit",
                    style: appText(size: 8, weight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          space(height: 22, width: 0),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 9,
              children: [
                if (specializations != null)
                  ...specializations.map(
                    (spec) => SpecializationCard(text: spec.name ?? ''),
                  ),
              ],
            ),
          ),
          space(height: 22, width: 0),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: appText(size: 18, weight: FontWeight.w600),
              ),
              space(height: 12, width: 0),
              Text(
                _astrologerProfileController
                        .astrologerProfileData
                        .value
                        .astroProfile
                        ?.desc ??
                    '',
                style: appText(size: 14, weight: FontWeight.w400),
              ),
            ],
          ),
          space(height: 19, width: 0),
          FeaturedWidget(),
          // Expanded(child: TipsScreen()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Video', style: appText(size: 13, weight: FontWeight.w400)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                VideoCardWidget(id: '1', thumbnail: thumbnail),
                VideoCardWidget(id: '1', thumbnail: thumbnail),
                VideoCardWidget(id: '1', thumbnail: thumbnail),
              ],
            ),
          ),

          const ReviewScreen(),
          space(height: 15, width: 0),
        ],
      ),
    );
  }
}
