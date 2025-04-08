import 'package:flutter/material.dart';
import 'package:open_astro/view/screens/my_profile/widgets/specialization_card.dart';

import '../../../../core/colors/color_pallet.dart';
import '../../../../core/font/app_font.dart';
import '../../../../service/image_provider.dart';
import '../../../widgets/space.dart';
import '../../navigation/widgets/video_card_widget.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  final String thumbnail =
      'https://s3-alpha-sig.figma.com/img/b283/5891/58f870bf0940aff3e099b3032c91587d?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JiuoeaI22vXTc0nslszquZERj00Jc5zQuoVEeimOzFyqDEOhUI31~fdl9FZgQJSkrsnXOPd9Ign0Htmdkjq4odIDZSHrNEm9v9cGH2pcjJ72mP9LLh24o9e6rttIeZvXBBvNijQzW-su-eYpJjbAECc4Be-LSEmBn6dHtbqgargaYfr~uLWO~z0eMY5QD69Pgdr04bopNS-biJjdPBAr4dnjvvPK9LqQdUnwH5QFAmL1R8u3j6pPMSeXGSkCAFH~6VyCyHyRfVFSK4fwrnE-UThp5C6uB-kda7iyGheCDoyOEU-LAfslYPD3O-U0unq-HIDOcUvhvTMh2-NH7MWIYg__';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Specialization',
                style: appText(size: 18, weight: FontWeight.w600),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 5,
              runSpacing: 10,
              children: [
                SpecializationCard(),
                SpecializationCard(),
                SpecializationCard(),
                SpecializationCard(),
                SpecializationCard(),
                SpecializationCard(),
              ],
            ),
          ),
          space(height: 25, width: 0),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: appText(size: 18, weight: FontWeight.w600),
              ),
              space(height: 5, width: 0),
              Text(
                'Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: appText(size: 14, weight: FontWeight.w400),
              ),
            ],
          ),
          space(height: 25, width: 0),

          Text('Featured', style: appText(size: 18, weight: FontWeight.w600)),
          space(height: 5, width: 0),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Container(
                  child: AppImageProvider.asset(
                    asset: 'user3',
                    height: 195,
                    width: 195,
                  ),
                ),
                Container(
                  child: AppImageProvider.asset(
                    asset: 'user4',
                    height: 195,
                    width: 195,
                  ),
                ),
              ],
            ),
          ),
          space(height: 15, width: 0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Video', style: appText(size: 18, weight: FontWeight.w600)),
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
          space(height: 15, width: 0),
        ],
      ),
    );
  }
}
