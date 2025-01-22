import 'package:flutter/material.dart';
import 'package:open_astro/view/widgets/appbar.dart';

import '../../widgets/user_card_widget.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key});
  final String thumbnail =
      'https://s3-alpha-sig.figma.com/img/b283/5891/58f870bf0940aff3e099b3032c91587d?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JiuoeaI22vXTc0nslszquZERj00Jc5zQuoVEeimOzFyqDEOhUI31~fdl9FZgQJSkrsnXOPd9Ign0Htmdkjq4odIDZSHrNEm9v9cGH2pcjJ72mP9LLh24o9e6rttIeZvXBBvNijQzW-su-eYpJjbAECc4Be-LSEmBn6dHtbqgargaYfr~uLWO~z0eMY5QD69Pgdr04bopNS-biJjdPBAr4dnjvvPK9LqQdUnwH5QFAmL1R8u3j6pPMSeXGSkCAFH~6VyCyHyRfVFSK4fwrnE-UThp5C6uB-kda7iyGheCDoyOEU-LAfslYPD3O-U0unq-HIDOcUvhvTMh2-NH7MWIYg__';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Followers'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: [
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  ),
                  UserCardWidget(
                    name: 'Rohan Das',
                    image: thumbnail,
                    id: 'test',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
