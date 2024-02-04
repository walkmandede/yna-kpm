import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/constants/app_assets.dart';
import 'package:wedding_app/constants/app_constants.dart';

class ImagePageview extends StatefulWidget {
  const ImagePageview({super.key});

  @override
  State<ImagePageview> createState() => _ImagePageviewState();
}

class _ImagePageviewState extends State<ImagePageview> {
  PageController pageController = PageController();
  List<String> imageList = [
    'assets/images/bg1.png',
    'assets/images/bg2.png',
    'assets/images/bg3.png',
    'assets/images/bg4.png',
    'assets/images/bg5.png',
    'assets/images/bg6.png',
  ];
  // Timer timer = Timer(Duration.zero, () {});
  @override
  void initState() {
    // timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (pageController.page!.toInt() == (imageList.length - 1)) {
    //     pageController.animateToPage(0,
    //         duration: const Duration(milliseconds: 300), curve: Curves.linear);
    //   } else {
    //     pageController.nextPage(
    //         duration: const Duration(milliseconds: 300), curve: Curves.linear);
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    // timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: imageList.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Image.asset(
              imageList[index],
              height: Get.height,
              width: Get.width,
              fit: BoxFit.fitWidth,
            );
          },
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            child: Container(
              color: Colors.transparent,
              width: 50,
              height: 50,
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: 50,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear);
            },
            child: Container(
              color: Colors.transparent,
              width: 50,
              height: 50,
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 50,
                color: Colors.white.withOpacity(0.75),
              ),
            ),
          ),
        )
      ],
    );
  }
}
