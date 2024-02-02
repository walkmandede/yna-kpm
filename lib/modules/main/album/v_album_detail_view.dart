import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/modules/main/album/c_album_controller.dart';
import 'package:wedding_app/modules/main/album/w_album_image_control_panel.dart';

class AlbumDetailView extends StatelessWidget {
  const AlbumDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    AlbumController controller = Get.find();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        backgroundColor: AppColors.bgGrey,
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        // ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: controller.currentImage,
                    builder: (context, currentImage, child) {
                      return Center(
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            currentImage,
                            fit: BoxFit.contain,
                            width: Get.width,
                          ),
                        ),
                        // child: Container(
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //       image: Image.asset(currentImage).image,
                        //       fit: BoxFit.contain
                        //     )
                        //   ),
                        // ),
                      );
                    },
                  ),
                ),
                const AlbumImageControlPanel()
              ],
            ),
            Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
