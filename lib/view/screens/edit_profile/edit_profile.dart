import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_astro/controller/astrologer_profile_controller.dart';

import '../../../controller/horoscope.dart';
import '../../../core/colors/color_pallet.dart';
import '../../../core/font/app_font.dart';
import '../../../service/image_picker.dart';
import '../../widgets/filter_chip.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/reg_input.dart';
import '../../widgets/space.dart';
import '../my_profile/widgets/profile_pic_alartbox.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final HoroscopeController _horoscopeController = Get.find();
  final AstrologerProfileController _astrologerProfileController = Get.find();

  List<String> selectedSpecializationIds = [];

  List<String?> selectedPujaIds = [];
  File? selectedImage;

  void imagePicker() async {
    try {
      final XFile? image = await imagePickerHandelar();

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
  void initState() {
    super.initState();

    final specializations =
        _astrologerProfileController
            .astrologerProfileData
            .value
            .astroProfile
            ?.specializations;

    final pujas =
        _astrologerProfileController
            .astrologerProfileData
            .value
            .astroProfile
            ?.puja;

    if (specializations != null) {
      selectedSpecializationIds = specializations.map((e) => e.sId!).toList();
    }
    if (pujas != null) {
      selectedPujaIds = pujas.map((e) => e.sId!).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(
      text: _astrologerProfileController.astrologerProfileData.value.realName,
    );

    final TextEditingController displayNameController = TextEditingController(
      text:
          _astrologerProfileController.astrologerProfileData.value.displayName,
    );

    final TextEditingController emailController = TextEditingController(
      text: _astrologerProfileController.astrologerProfileData.value.email,
    );

    final TextEditingController exprienceController = TextEditingController(
      text:
          _astrologerProfileController
              .astrologerProfileData
              .value
              .astroProfile
              ?.experience
              .toString(),
    );

    final TextEditingController descriptionController = TextEditingController(
      text:
          _astrologerProfileController
              .astrologerProfileData
              .value
              .astroProfile
              ?.desc,
    );

    @override
    void dispose() {
      nameController.dispose();
      displayNameController.dispose();
      emailController.dispose();
      exprienceController.dispose();
      descriptionController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(centerTitle: false, title: const Text('Edit Profile')),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                space(height: 8, width: 0),
                GestureDetector(
                  onTap: () {
                    profilePicAlert(
                      context: context,
                      imageUploadFunc: imagePicker,
                      selectedImage: selectedImage,
                    );
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
                      backgroundColor: AppColor().primary.withValues(
                        alpha: 0.2,
                      ),
                      // backgroundImage:
                      //     selectedImage != null
                      //         ? FileImage(selectedImage!)
                      //         : null,
                      child: const Icon(Icons.person, size: 40),
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
                  text: 'Update',
                  onClicked: () {},
                  isLoading: false,
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
