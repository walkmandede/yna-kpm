import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/album/c_album_controller.dart';

class AlbumImageControlPanel extends StatelessWidget {
  const AlbumImageControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    AlbumController controller = Get.find();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: Get.height * 0.015
      ),
      child: SingleChildScrollView(
        controller: controller.imagesScrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: Get.height*0.025
        ),
        child: ValueListenableBuilder(
          valueListenable: controller.currentImage,
          builder: (context, currentImage, child) {
            return Row(
              children: controller.images.map((eachImage) {
                bool xSelected = eachImage == currentImage;
                return GestureDetector(
                  onTap: () {
                    controller.currentImage.value = eachImage;
                    controller.currentImage.notifyListeners();
                  },
                  child: Container(
                    width: controller.eachImageSize,
                    height: controller.eachImageSize,
                    margin: EdgeInsets.only(
                      right: controller.eachImageMargin
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: Image.asset(eachImage).image,
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        if(!xSelected)Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black.withOpacity(0.7)
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        )
      )
    );
  }
}
