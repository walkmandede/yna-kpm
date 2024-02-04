import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius)
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: Get.height * 0.025
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CupertinoActivityIndicator(
                radius: 16,
              ),
              (Get.height * 0.025).heightBox(),
              const Text(
                "Loading...\nPlease Wait!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
