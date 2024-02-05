import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/modules/main/rsvp/c_rsvp_controller.dart';
import 'package:wedding_app/modules/main/wedding/c_wedding_controller.dart';
import 'package:wedding_app/modules/main/wedding/w_wedding_map_widget.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_functions.dart';
import '../../../constants/app_svgs.dart';
import '../../../constants/app_widgets.dart';
import '../home/c_home_controller.dart';
import '../home/w_wish_form_page.dart';

class RsvpPage extends StatelessWidget {
  const RsvpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RsvpController());
    return LayoutBuilder(
      builder: (context, constraints) {
        final layoutSize = Size(constraints.maxWidth,constraints.maxHeight);
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset(AppAssets.rsvpBg).image,
                  fit: BoxFit.fill
              )
          ),
          padding: EdgeInsets.symmetric(
            horizontal: min(30, layoutSize.width*0.15),
            vertical: min(100, layoutSize.height*0.2)
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(
              min(10, layoutSize.width*0.01)
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                color: AppColors.gold,
                width: 2.5
              )
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: min(20, layoutSize.width*0.025),
                vertical: min(20, layoutSize.width*0.035)
              ),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                      color: AppColors.gold,
                      width: 2
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "RSVP",
                      style: GoogleFonts.jomolhari(
                        fontSize: 25,
                      ),
                    ),
                    6.heightBox(),
                    Text(
                      "Join us in Celebrating Love and Commitment",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    10.heightBox(),
                    TextField(
                      controller: controller.txtName,
                      decoration: InputDecoration(
                          border: AppWidgets.textFieldBorder(),
                          enabledBorder: AppWidgets.textFieldBorder(),
                          focusedBorder: AppWidgets.textFieldBorder(),
                          labelText: "Name"
                      ),
                      maxLines: 1,
                      onTapOutside: (event) {
                        dismissKeyboard();
                      },
                      cursorColor: AppColors.brown,
                    ),
                    10.heightBox(),
                    TextField(
                      controller: controller.txtPhone,
                      decoration: InputDecoration(
                          border: AppWidgets.textFieldBorder(),
                          enabledBorder: AppWidgets.textFieldBorder(),
                          focusedBorder: AppWidgets.textFieldBorder(),
                          labelText: "Phone"
                      ),
                      keyboardType: TextInputType.phone,
                      maxLines: 1,
                      onTapOutside: (event) {
                        dismissKeyboard();
                      },
                      cursorColor: AppColors.brown,
                    ),
                    10.heightBox(),
                    Row(
                      children: [
                        const Flexible(
                          child: FittedBox(
                            child: Text(
                              "No. of people",
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        5.widthBox(),
                        const Spacer(),
                        IconButton(onPressed: () {
                          if(controller.totalPeople.value>1){
                            controller.totalPeople.value--;
                            controller.totalPeople.notifyListeners();
                          }
                        }, icon: const Icon(Icons.remove)),
                        ValueListenableBuilder(
                          valueListenable: controller.totalPeople,
                          builder: (context, totalPeople, child) {
                            return Text(
                              totalPeople.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            );
                          },
                        ),
                        IconButton(onPressed: () {
                          controller.totalPeople.value++;
                          controller.totalPeople.notifyListeners();
                        }, icon: const Icon(Icons.add)),
                      ],
                    ),
                    10.heightBox(),
                    TextField(
                      controller: controller.txtNotes,
                      decoration: InputDecoration(
                          border: AppWidgets.textFieldBorder(),
                          enabledBorder: AppWidgets.textFieldBorder(),
                          focusedBorder: AppWidgets.textFieldBorder(),
                          labelText: "Note(Optional)"
                      ),
                      keyboardType: TextInputType.phone,
                      maxLines: 1,
                      onTapOutside: (event) {
                        dismissKeyboard();
                      },
                      cursorColor: AppColors.brown,
                    ),
                    10.heightBox(),
                    SizedBox(
                      height: 50,
                      width: layoutSize.width,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.onClickAccept();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: AppColors.red,
                        ),
                        child: const Text(
                          "Accept with pleasure",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                    20.heightBox(),
                    RichText(
                      text: TextSpan(
                        text: "Your Presence",
                        style: DefaultTextStyle.of(context).style.copyWith(
                          color: AppColors.red,
                          fontWeight: FontWeight.bold
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                              text: " is present enough but if you can't join in person but want to contribute, your generosity is appreciated. your support adds joy to our special day",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black
                              )
                          ),
                        ],
                      ),
                    ),
                    10.heightBox(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: layoutSize.width * 0.18,
                          child: Text(
                            "KPay",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gold
                            ),
                          ),
                        ),
                        2.widthBox(),
                        const SelectableText(
                          "09756690082,\n09756690081",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    5.heightBox(),
                    Row(
                      children: [
                        SizedBox(
                          width: layoutSize.width * 0.18,
                          child: Text(
                            "CB",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gold
                            ),
                          ),
                        ),
                        2.widthBox(),
                        const SelectableText(
                          "0016 6005 0009 6555",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                    5.heightBox(),
                    Row(
                      children: [
                        SizedBox(
                          width: layoutSize.width * 0.18,
                          child: Text(
                            "AYA",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.gold
                            ),
                          ),
                        ),
                        2.widthBox(),
                        const SelectableText(
                          "20009398700",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
