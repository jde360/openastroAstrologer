import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/astrologer_profile_controller.dart';
import '../../../../service/image_provider.dart';
import '../../../ui_helper/ui_helper.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/space.dart';

Future<void> profilePicAlert({
  required BuildContext context,
  required Function imageUploadFunc,
  File? selectedImage,
}) async {
  final AstrologerProfileController _astrologerProfileController = Get.find();

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return ImageUpload(
        astrologerProfileController: _astrologerProfileController,
        selectedImage: selectedImage,
        imageUploadFunc: imageUploadFunc,
      );
    },
  );
}

class ImageUpload extends StatefulWidget {
  final AstrologerProfileController astrologerProfileController;
  final File? selectedImage;
  final Function imageUploadFunc;

  const ImageUpload({
    super.key,
    required this.astrologerProfileController,
    required this.selectedImage,
    required this.imageUploadFunc,
  });

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      actionsOverflowButtonSpacing: 0,
      insetPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      content: SizedBox(
        width: percentWidth(percent: 95),
        child: Obx(() {
          final profileImage =
              widget
                  .astrologerProfileController
                  .astrologerProfileData
                  .value
                  .profileImage;

          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: SizedBox(
              width: double.infinity,
              height: percentHeight(percent: 25),
              child:
                  widget.selectedImage != null
                      ? Image.file(widget.selectedImage!, fit: BoxFit.cover)
                      : profileImage == null || profileImage.isEmpty
                      ? AppImageProvider.asset(
                        asset: 'user1',
                        height: 73,
                        width: 73,
                      )
                      : AppImageProvider.network(103, 100, url: profileImage),
            ),
          );
        }),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          width: percentWidth(percent: 27),
          child: AppPrimaryButton(
            text: 'Update',
            onClicked: () {
              widget.imageUploadFunc();
            },
            isLoading: false,
          ),
        ),
      ],
    );
  }
}
