import 'package:flutter/material.dart';

import '../../../../core/font/app_font.dart';
import '../../../widgets/space.dart';
import '../../navigation/widgets/video_card_widget.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  // final String thumbnail =
  //     'https://s3-alpha-sig.figma.com/img/b283/5891/58f870bf0940aff3e099b3032c91587d?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JiuoeaI22vXTc0nslszquZERj00Jc5zQuoVEeimOzFyqDEOhUI31~fdl9FZgQJSkrsnXOPd9Ign0Htmdkjq4odIDZSHrNEm9v9cGH2pcjJ72mP9LLh24o9e6rttIeZvXBBvNijQzW-su-eYpJjbAECc4Be-LSEmBn6dHtbqgargaYfr~uLWO~z0eMY5QD69Pgdr04bopNS-biJjdPBAr4dnjvvPK9LqQdUnwH5QFAmL1R8u3j6pPMSeXGSkCAFH~6VyCyHyRfVFSK4fwrnE-UThp5C6uB-kda7iyGheCDoyOEU-LAfslYPD3O-U0unq-HIDOcUvhvTMh2-NH7MWIYg__';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        space(height: 15, width: 0),

        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
              // VideoCardWidget(id: '1', thumbnail: thumbnail),
            ],
          ),
        ),
        space(height: 15, width: 0),
      ],
    );
  }
}
