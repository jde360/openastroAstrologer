import 'package:flutter/material.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';
import 'package:open_astro/view/widgets/primary_button.dart';
import 'package:get/get.dart';

import '../../service/local_storage.dart';

Future<void> logoutAlertBox(context) async {
  final LocalStorage _localStorage = LocalStorage();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: const Text('Log Out'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text('Are you sure you want to logout?')],
          ),
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
              text: 'Log Out',
              onClicked: () {
                _localStorage.removeToken();
                _localStorage.setLatestFalse();
                Get.offAllNamed('/');
              },
              isLoading: false,
            ),
          ),
        ],
      );
    },
  );
}
