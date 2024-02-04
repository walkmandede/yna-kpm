import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/constants/app_widgets.dart';
import 'package:wedding_app/modules/main/home/c_home_controller.dart';

class HomeWishFormWidget extends StatelessWidget {
  const HomeWishFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: min(30, Get.height * 0.05)
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15
          ),
          decoration: BoxDecoration(
            color: AppColors.bgYellow,
            border: Border.all(),
            borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            children: [
              Text(
                "Please give us Tips and Advices or Wishes for our upcoming marriage",
                style: TextStyle(fontSize: 16,color: AppColors.brown,fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              10.heightBox(),
              TextField(
                controller: controller.txtName,
                decoration: InputDecoration(
                    border: AppWidgets.textFieldBorder(),
                    enabledBorder: AppWidgets.textFieldBorder(),
                    focusedBorder: AppWidgets.textFieldBorder(),
                    labelText: "Name(Optional)"
                ),
                maxLines: 1,
                onTapOutside: (event) {
                  dismissKeyboard();
                },
                cursorColor: AppColors.brown,
              ),
              10.heightBox(),
              TextField(
                controller: controller.txtWish,
                decoration: InputDecoration(
                    border: AppWidgets.textFieldBorder(),
                    enabledBorder: AppWidgets.textFieldBorder(),
                    focusedBorder: AppWidgets.textFieldBorder(),
                    labelText: "Tips and advices or wishes"
                ),
                maxLines: 3,
                onTapOutside: (event) {
                  dismissKeyboard();
                },
                cursorColor: AppColors.brown,
              ),
              10.heightBox(),
              SizedBox(
                width: double.infinity,
                height: max(Get.height*0.05,45),
                child: ElevatedButton(
                  onPressed: () {
                    controller.onClickSend();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                  child: const Text("Send"),
                ),
              ),
              10.heightBox(),
              TextButton(
                onPressed: () {
                  controller.xDialogOpen.value = false;
                  controller.xDialogOpen.notifyListeners();
                },
                child: const Text("Back"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
