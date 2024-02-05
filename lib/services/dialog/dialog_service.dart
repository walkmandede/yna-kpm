import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_constants.dart';
import '../../constants/app_functions.dart';
import 'dialogs/loading_dialog.dart';
import 'dialogs/transaction_dialog.dart';

DialogRoute? dialogRoute;

class DialogService{

  void showTransactionDialog({
    required String text,
    Function()? onClickYes,
    String yesButtonText = "Continue",
    String noButtonText = "Cancel",
  }){
    if(dialogRoute!=null){
      dismissDialog();
    }
    dialogRoute = DialogRoute(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius),
          ),
          child: TransactionDialog(
            text: text,
            yesButtonText: yesButtonText,
            noButtonText: noButtonText,
            onClickYes: () {
              if(onClickYes!=null){
                onClickYes();
              }
              else{
                dismissDialog();
              }
            },
          ),
        );
      },
    );
    Navigator.of(Get.context!).push(dialogRoute!);
  }

  void showSnack({
    required String title,
    required String message,
    Color bgColor = Colors.black
  }){
    Get.snackbar(
        title,
        message,
        backgroundColor: bgColor.withOpacity(0.65),
        colorText: AppColors.white
    );
  }

  void showLoadingDialog(){
    if(dialogRoute!=null){
      dismissDialog();
    }
    dialogRoute = DialogRoute(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) {
        return  Dialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius),
          ),
          child: const LoadingDialog(),
        );
      },
    );
    Navigator.of(Get.context!).push(dialogRoute!);
  }

  void dismissDialog(){
    // dialog1Key.currentState!.pop();
    try{
      if(dialogRoute!=null){
        Navigator.of(Get.context!).removeRoute(dialogRoute!);
        dialogRoute=null;
      }
    }
    catch(e){
      null;
    }
  }

  void showFullScreenKeyboard({required TextEditingController txtCtrl}){
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
          ),
          child: TextField(
            autofocus: true,
            controller: txtCtrl,
            onTapOutside: (event) {
              dismissKeyboard();
            },
            onEditingComplete: () {
              // Get.back(canPop: false);
            },
            onSubmitted: (value) {
              Get.back(canPop: false);
            },
          ),
        ),
        backgroundColor: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(10)
            )
        )
    );
  }

}


