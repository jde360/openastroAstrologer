import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/horoscope.dart';
import '../../../core/colors/color_pallet.dart';
import '../../../core/font/app_font.dart';
import '../../widgets/filter_chip.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/reg_input.dart';
import '../../widgets/space.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final HoroscopeController _horoscopeController = Get.find();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController displayNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController exprienceController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  List<String> selectedSpecializationIds = [];

  List<String> selectedPujaIds = [];

  @override
  void dispose() {
    nameController.dispose();
    displayNameController.dispose();
    emailController.dispose();
    exprienceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  onTap: () {},
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
