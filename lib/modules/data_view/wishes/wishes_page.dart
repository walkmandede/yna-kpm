import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/services/api_services.dart';

class WishesPage extends StatefulWidget {
  const WishesPage({super.key});

  @override
  State<WishesPage> createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {

  ValueNotifier<bool> xLoading = ValueNotifier(false);
  ValueNotifier<List<Map>> data = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    updateData();
  }

  Future<void> updateData() async{
    xLoading.value = true;
    xLoading.notifyListeners();
    try{
      await http.get(
        Uri.parse("${ApiServices.baseUrl}/wish")
      ).then((value) {
        superPrint(value.body);
        data.value.clear();
        data.notifyListeners();
        Iterable iterable = jsonDecode(value.body) as Iterable;
        for (var element in iterable) {
          data.value.add(element);
        }
      });
    }
    catch(e){
      superPrint(e);
      null;
    }
    xLoading.value = false;
    xLoading.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishes Page"),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {
            updateData();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        child: ValueListenableBuilder(
          valueListenable: xLoading,
          builder: (context, xLoading, child) {
            if(xLoading){
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            else{
              return ValueListenableBuilder(
                valueListenable: data,
                builder: (context, data, child) {
                  if(data.isEmpty){
                    return const Center(
                      child: Text("No Data Yet"),
                    );
                  }
                  else{
                    Set<String> totalDevices = {};
                    for (var value in data) {
                      totalDevices.add(value["deviceInfo"].toString());
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Wishes : ${data.length}"),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final eachData = data[data.length-index-1];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    eachData["wish"].toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    eachData["name"].toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey
                                    ),
                                  ),

                                  Text(
                                    (DateTime.tryParse(eachData["createdAt"].toString())??DateTime(2000)).toLocal().toString().substring(0,16),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
