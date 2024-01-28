import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/modules/main/album/v_album_detail_view.dart';

import 'c_album_controller.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  Get.put(AlbumController());
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        backgroundColor: AppColors.bgYellow,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: (Get.height * 0.025),
            // vertical: (Get.height * 0.025)
          ),
          child: SingleChildScrollView(
            controller: controller.scrollController,
            key: const PageStorageKey("Story Page"),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (Get.mediaQuery.padding.top).heightBox(),
                  imageWidget(imagePath: AppAssets.a1,),
                  gapWidget(),
                  Row(
                    children: [
                      Expanded(
                        flex: 167,
                        child: imageWidget(imagePath: AppAssets.a2,),
                      ),
                      gapFlexWidget(15),
                      Expanded(
                        flex: 170,
                        child: Column(
                          children: [
                            imageWidget(imagePath: AppAssets.a3,),
                            gapWidget(height: 10),
                            imageWidget(imagePath: AppAssets.a4,),
                          ],
                        ),
                      )
                    ],
                  ),
                  gapWidget(),
                  Row(
                    children: [
                      Expanded(
                        flex: 214,
                        child: Column(
                          children: [
                            imageWidget(imagePath: AppAssets.a5,),
                            gapWidget(height: 14),
                            imageWidget(imagePath: AppAssets.a7,),
                          ],
                        ),
                      ),
                      gapFlexWidget(14),
                      Expanded(
                        flex: 124,
                        child: Column(
                          children: [
                            imageWidget(imagePath: AppAssets.a6,),
                            gapWidget(height: 13),
                            imageWidget(imagePath: AppAssets.a8,),
                          ],
                        ),
                      )
                    ],
                  ),
                  (Get.height * 0.1).heightBox(),
                  (Get.mediaQuery.padding.bottom).heightBox(),
                ]
            ),
          ),
        ),
      )
    );
  }

  Widget gapWidget({double height = 15}){
    return height.heightBox();
  }

  Widget gapFlexWidget(int flex){
    return Expanded(flex: flex,child: Container(),);
  }
  
  Widget imageWidget({required String imagePath}){
    return GestureDetector(
      onTap: () {
        AlbumController controller = Get.find();
        controller.currentImage.value = imagePath;
        controller.currentImage.notifyListeners();
        Get.to(()=> const AlbumDetailView());
      },
      child: Image.asset(imagePath),
    );
  }
  
}
