import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/modules/data_view/rsvps/rsvp_page.dart';
import 'package:wedding_app/modules/data_view/visitors/visitors_page.dart';
import 'package:wedding_app/modules/data_view/wishes/wishes_page.dart';

class DataViewMainPage extends StatefulWidget {
  const DataViewMainPage({super.key});

  @override
  State<DataViewMainPage> createState() => _DataViewMainPageState();
}

class _DataViewMainPageState extends State<DataViewMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () {
              Get.to(()=> const VisitorsPage());
            }, child: const Text("Visitors")),
            TextButton(onPressed: () {
              Get.to(()=> const WishesPage());
            }, child: const Text("Wishes")),
            TextButton(onPressed: () {
              Get.to(()=> const RsvpPage());
            }, child: const Text("RSVPs"))
          ],
        ),
      ),
    );
  }
}
