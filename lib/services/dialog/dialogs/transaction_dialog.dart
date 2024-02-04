import 'package:flutter/material.dart';
import 'package:wedding_app/constants/app_extensions.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_constants.dart';
import '../../../constants/app_functions.dart';
import '../dialog_service.dart';

class TransactionDialog extends StatelessWidget {
  final String text;
  final Function() onClickYes;
  final String yesButtonText;
  final String noButtonText;
  const TransactionDialog({
    super.key,
    this.text = "Are you suer?",
    required this.onClickYes,
    this.yesButtonText = "Continue",
    this.noButtonText = "Cancel",
  });

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
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
              ),
              10.heightBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      DialogService().dismissDialog();
                    },
                    child: Text(noButtonText,style: TextStyle(color: AppColors.red),),
                  ),
                  TextButton(
                    onPressed: () {
                      vibrateNow();
                      onClickYes();
                      DialogService().dismissDialog();
                    },
                    child: Text(yesButtonText,style: const TextStyle(color: Colors.black),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
