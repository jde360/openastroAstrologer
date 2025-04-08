import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_astro/controller/horoscope.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/view/widgets/primary_button.dart';
import 'package:open_astro/view/widgets/reg_input.dart';
import 'package:open_astro/view/widgets/snack_bar.dart';
import 'package:open_astro/view/widgets/space.dart';

import '../../../core/font/app_font.dart';
import '../../widgets/filter_chip.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final HoroscopeController _horoscopeController = Get.find();

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

  File? selectedImage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController exprienceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> selectedSpecializationIds = [];
  List<String> selectedPujaIds = [];

  void imagePicker() async {
    final ImagePicker picker = ImagePicker();

    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          selectedImage = File(image.path);
        });
      } else {
        log('No image selected.');
      }
    } catch (e) {
      log('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                space(height: 78, width: 0),
                GestureDetector(
                  onTap: () {
                    imagePicker();
                  },
                  child: Badge(
                    alignment: Alignment.bottomRight,
                    backgroundColor: Colors.transparent,
                    offset: const Offset(-30, -20),
                    label: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt_rounded),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColor().primary.withOpacity(0.2),
                      backgroundImage:
                          selectedImage != null
                              ? FileImage(selectedImage!)
                              : null,
                      child:
                          selectedImage == null
                              ? const Icon(Icons.person, size: 40)
                              : null,
                    ),
                  ),
                ),
                space(height: 22, width: 0),
                RegInput(
                  name: 'Name',
                  controller: nameController,
                  isNum: false,
                  length: 50,
                  hint: 'Enter your name',
                ),
                space(height: 22, width: 0),
                RegInput(
                  name: 'Display Name',
                  controller: displayNameController,
                  isNum: false,
                  length: 50,
                  hint: 'Enter display name',
                ),
                space(height: 22, width: 0),
                RegInput(
                  name: 'Email',
                  controller: emailController,
                  isNum: false,
                  length: 50,
                  hint: 'Enter your email address',
                ),
                space(height: 22, width: 0),
                RegInput(
                  name: 'Exprience',
                  controller: exprienceController,
                  isNum: true,
                  length: 50,
                  hint: 'Enter your exprience in year',
                ),
                space(height: 22, width: 0),
                RegInput(
                  name: 'Description',
                  controller: descriptionController,
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
                      ..._horoscopeController.listOfSpecilizations.map((e) {
                        final isSelected = selectedSpecializationIds.contains(
                          e.sId,
                        );
                        return AppFilterChip(
                          isSelected: isSelected,
                          onClick: () {
                            setState(() {
                              if (isSelected) {
                                selectedSpecializationIds.remove(e.sId);
                              } else {
                                selectedSpecializationIds.add(e.sId!);
                              }
                            });
                          },
                          text: e.name!,
                        );
                      }),
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
                      ..._horoscopeController.listOfPuja.map((e) {
                        final isSelected = selectedPujaIds.contains(e.sId);
                        return AppFilterChip(
                          isSelected: isSelected,
                          onClick: () {
                            setState(() {
                              if (isSelected) {
                                selectedPujaIds.remove(e.sId);
                              } else {
                                selectedPujaIds.add(e.sId!);
                              }
                            });
                          },
                          text: e.name!,
                        );
                      }),
                    ],
                  ),
                ),
                space(height: 22, width: 0),
                AppPrimaryButton(
                  text: 'Submit',
                  onClicked: () {
                    if (displayNameController.text.isEmpty ||
                        nameController.text.isEmpty ||
                        exprienceController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        selectedSpecializationIds.isEmpty ||
                        selectedPujaIds.isEmpty ||
                        selectedImage == null) {
                      showSnackbar(
                        context: context!,
                        message: 'Every fields are required',
                      );
                      return;
                    }
                    _horoscopeController.register(
                      displayName: displayNameController.text,
                      realName: nameController.text,
                      experience: int.tryParse(exprienceController.text) ?? 0,
                      desc: descriptionController.text,
                      email: emailController.text,
                      specializations: selectedSpecializationIds,
                      puja: selectedPujaIds,
                      image: selectedImage!,
                    );
                  },
                  isLoading: _horoscopeController.isLoading.value,
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
        );
      }),
    );
  }
}
