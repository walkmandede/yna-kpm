import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(AppAssets.homeBg).image,
          fit: BoxFit.cover
        )
      ),
      child: Column(
        children: [
          (Get.mediaQuery.padding.top).heightBox(),
          (Get.height * 0.005).heightBox(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Text(
                      "We are getting married",
                      style: GoogleFonts.alexBrush(
                          fontSize: 2000,
                          color: AppColors.red
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
