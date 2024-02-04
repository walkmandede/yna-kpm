import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class WeddingController extends GetxController {
  ValueNotifier<bool> xInitialVisit = ValueNotifier(true);
  ValueNotifier<bool> xDialogOpen = ValueNotifier(false);
  MapController mapController = MapController();

  LatLng weddingLocation = const LatLng(16.8789202, 96.1128401);

  @override
  void onInit() {
    super.onInit();
    initLoad();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<void> initLoad() async {}
}
