import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
      width: double.infinity,
      height: max(350,Get.height * 0.5),
      margin: EdgeInsets.symmetric(
        horizontal: min(30, Get.height * 0.05)
      ),
      decoration: BoxDecoration(
        color: AppColors.bgYellow,
        border: Border.all(),
        borderRadius: BorderRadius.circular(12)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: controller.weddingLocation,
            initialZoom: 16
          ),
          mapController: controller.mapController,
          children: [
            TileLayer(
              urlTemplate: "https://cartodb-basemaps-{s}.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png",
            ),
            MarkerLayer(
              markers: [
                Marker(
                    width: 35,
                    height: 35,
                    point: controller.weddingLocation,
                    alignment: Alignment.center,
                    child: SvgPicture.string(
                      AppSvgs.markerIcon,
                      width: 35,
                      height: 35,
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
