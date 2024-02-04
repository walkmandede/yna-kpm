import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_extensions.dart';

import 'package:wedding_app/modules/main/album/v_album_detail_view.dart';

import 'c_album_controller.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AlbumController());
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: Scaffold(
          backgroundColor: AppColors.bgYellow,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: (Get.height * 0.025),
                  // vertical: (Get.height * 0.025)
                ),
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  key: const PageStorageKey("Album Page"),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        (Get.mediaQuery.padding.top).heightBox(),
                        20.heightBox(),
                        Row(
                          children: [
                            Expanded(
                                flex: 170,
                                child: imageWidget(
                                  imagePath: AppAssets.a1,
                                )),
                            gapFlexWidget(15),
                            Expanded(
                                flex: 170,
                                child: imageWidget(
                                  imagePath: AppAssets.a2,
                                )),
                          ],
                        ),
                        gapWidget(),
                        imageWidget(imagePath: AppAssets.a3),
                        gapWidget(),
                        Row(
                          children: [
                            Expanded(
                              flex: 167,
                              child: imageWidget(
                                imagePath: AppAssets.a4,
                              ),
                            ),
                            gapFlexWidget(15),
                            Expanded(
                              flex: 170,
                              child: Column(
                                children: [
                                  imageWidget(
                                    imagePath: AppAssets.a5,
                                  ),
                                  15.widthBox(),
                                  imageWidget(
                                    imagePath: AppAssets.a6,
                                  ),
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
                                  imageWidget(
                                    imagePath: AppAssets.a7,
                                  ),
                                  gapWidget(height: 14),
                                  imageWidget(
                                    imagePath: AppAssets.a10,
                                  ),
                                ],
                              ),
                            ),
                            gapFlexWidget(14),
                            Expanded(
                              flex: 124,
                              child: Column(
                                children: [
                                  imageWidget(
                                    imagePath: AppAssets.a9,
                                  ),
                                  gapWidget(height: 13),
                                  imageWidget(
                                    imagePath: AppAssets.a8,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        (Get.height * 0.1).heightBox(),
                        (Get.mediaQuery.padding.bottom).heightBox(),
                      ]),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    print('object');
                    AlbumController controller = Get.find();
                    controller.currentImage.value = controller.images[0];
                    controller.currentImage.notifyListeners();

                    Get.to(() => const AlbumDetailView());
                    Future.delayed(const Duration(milliseconds: 500))
                        .then((value) {
                      if (controller.scrollController.hasClients) {
                        final imageScrollPadding = Get.height * 0.025;
                        final currentIndex = controller.images
                                .indexOf(controller.currentImage.value) -
                            1.75;
                        controller.imagesScrollController.animateTo(
                            controller.eachImageMargin +
                                (imageScrollPadding +
                                    ((controller.eachImageSize +
                                            controller.eachImageMargin) *
                                        currentIndex)),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.primary.withOpacity(0.1),
                              blurRadius: 4,
                              spreadRadius: 4,
                              offset: const Offset(0, 4))
                        ]),
                    child: const Icon(
                      Icons.rectangle,
                      size: 30,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget gapWidget({double height = 15}) {
    return height.heightBox();
  }

  Widget gapFlexWidget(int flex) {
    return Expanded(
      flex: flex,
      child: Container(),
    );
  }

  Widget imageWidget({required String imagePath}) {
    return GestureDetector(
      onTap: () {
        AlbumController controller = Get.find();
        controller.currentImage.value = imagePath;
        // controller.currentImage.notifyListeners();

        Get.to(() => const AlbumDetailView());
        Future.delayed(const Duration(milliseconds: 500)).then((value) {
          if (controller.scrollController.hasClients) {
            final imageScrollPadding = Get.height * 0.025;
            final currentIndex =
                controller.images.indexOf(controller.currentImage.value) - 1.75;
            controller.imagesScrollController.animateTo(
                controller.eachImageMargin +
                    (imageScrollPadding +
                        ((controller.eachImageSize +
                                controller.eachImageMargin) *
                            currentIndex)),
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          }
        });
      },
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(imagePath)),
    );
  }
}
