import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/view/widgets/primary_button.dart';
import 'package:open_astro/view/widgets/reg_input.dart';
import 'package:open_astro/view/widgets/space.dart';

import '../../../core/font/app_font.dart';
import '../../widgets/filter_chip.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final List<String> specialization = [
    'Birth Chart Analysis',
    'Comforpatibility Matching',
    'Carreer Guidance',
    'Finance Planning',
    'Relationship Advice',
    'Health Prediction',
    'Future Prediction',
    'Gemstone Recommendations',
    'Remedial Measures',
    'Electional Astrology',
  ];

  final List<String> puja = [
    'Navagraha Puja',
    'Shani Shanti Puja',
    'Mangal Dosha Puja',
    'Rahu Ketu Shanti Puja',
    'Kaal Sarp Dosh Puja',
    'Chandra Graha Shanti Puja',
    'Guru Graha Shanti Puja',
    'Budh Graha Shanti Puja',
    'Surya Graha Shanti Puja',
    'Lakshmi Narayan Puja',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              space(height: 78, width: 0),
              Badge(
                alignment: Alignment.bottomRight,
                backgroundColor: Colors.transparent,
                offset: const Offset(-30, -20),
                label: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.camera_alt_rounded,
                  ),
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor().primary.withOpacity(0.2),
                ),
              ),
              space(height: 22, width: 0),
              RegInput(
                  name: 'Name',
                  controller: TextEditingController(),
                  isNum: false,
                  length: 50,
                  hint: 'Enter your name'),
              space(height: 22, width: 0),
              RegInput(
                  name: 'Display Name',
                  controller: TextEditingController(),
                  isNum: false,
                  length: 50,
                  hint: 'Enter display name'),
              space(height: 22, width: 0),
              RegInput(
                  name: 'Email',
                  controller: TextEditingController(),
                  isNum: false,
                  length: 50,
                  hint: 'Enter your email address'),
              space(height: 22, width: 0),
              RegInput(
                  name: 'Exprience',
                  controller: TextEditingController(),
                  isNum: true,
                  length: 50,
                  hint: 'Enter your exprience in year'),
              space(height: 22, width: 0),
              RegInput(
                name: 'Description',
                controller: TextEditingController(),
                isNum: false,
                length: 50,
                hint: 'Write about yourself',
                isDesc: true,
              ),
              space(height: 22, width: 0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Specialization',
                  style: appText(size: 16, weight: FontWeight.w400),
                ),
              ),
              space(height: 16, width: 0),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    ...specialization.map(
                      (e) => AppFilterChip(
                        isSelected: true,
                        onClick: () {},
                        text: e,
                      ),
                    )
                  ],
                ),
              ),
              space(height: 22, width: 0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Puja',
                  style: appText(size: 16, weight: FontWeight.w400),
                ),
              ),
              space(height: 16, width: 0),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    ...puja.map(
                      (e) => AppFilterChip(
                        isSelected: false,
                        onClick: () {},
                        text: e,
                      ),
                    )
                  ],
                ),
              ),
              space(height: 22, width: 0),
              AppPrimaryButton(
                text: 'Submit',
                onClicked: () {
                  Get.offAllNamed('/fregment');
                },
                isLoading: false,
              ),
              space(height: 25, width: 0),
              Text(
                'Panchang (or Panchanga) is a traditional Hindu calendar and almanac that provides detailed information about the cosmic and terrestrial aspects of a given day. It is widely used in India for determining auspicious times (muhurtas), performing rituals, and planning events like weddings, religious ceremonies, and festivals.',
                style: appText(size: 9, weight: FontWeight.w400),
              ),
              space(height: 25, width: 0),
            ],
          ),
        ),
      ),
    );
  }
}
