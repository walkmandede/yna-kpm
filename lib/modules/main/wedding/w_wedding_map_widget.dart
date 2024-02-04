import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:wedding_app/constants/app_colors.dart';
import 'package:wedding_app/constants/app_extensions.dart';
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/constants/app_svgs.dart';
import 'package:wedding_app/constants/app_widgets.dart';
import 'package:wedding_app/modules/main/home/c_home_controller.dart';
import 'package:wedding_app/modules/main/wedding/c_wedding_controller.dart';

class WeddingMapWidget extends StatelessWidget {
  const WeddingMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WeddingController controller = Get.find();
    return Container(
      width: min(Get.width, 350),
      height: min(350, Get.width),
      margin: EdgeInsets.symmetric(horizontal: min(20, Get.height * 0.05)),
      decoration: BoxDecoration(
          color: AppColors.bgYellow,
          border: Border.all(),
          borderRadius: BorderRadius.circular(12)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: FlutterMap(
          options: MapOptions(
              initialCenter: controller.weddingLocation, initialZoom: 16),
          mapController: controller.mapController,
          children: [
            TileLayer(
              urlTemplate:
                  "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
            ),
            MarkerLayer(
              markers: [
                // Marker(
                //     point: controller.weddingLocation,
                //     child: Icon(Icons.circle)),
                Marker(
                    width: Get.width - 20,
                    height: 235,
                    point: controller.weddingLocation,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal: min(30, Get.height * 0.05)),
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal: min(10, Get.height * 0.015),
                              vertical: min(10, Get.height * 0.015)),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Nyaung Kan Aye TharThaNa YeikThar\n(Insein Kyo Kone)",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jomolhari(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal),
                              ),
                              5.heightBox(),
                              Text(
                                "Insein Road, Insein Township,\nNear Gyo Kone Bus Stop, Yangon",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.string(
                          AppSvgs.markerIcon,
                          width: 35,
                          height: 35,
                        ),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
