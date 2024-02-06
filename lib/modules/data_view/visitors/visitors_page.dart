import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_app/constants/app_functions.dart';
import 'package:wedding_app/services/api_services.dart';

class VisitorsPage extends StatefulWidget {
  const VisitorsPage({super.key});

  @override
  State<VisitorsPage> createState() => _VisitorsPageState();
}

class _VisitorsPageState extends State<VisitorsPage> {

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
        Uri.parse("${ApiServices.baseUrl}/visiter")
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
        title: const Text("Visitors Page"),
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
                        Text("Total Visits : ${data.length}"),
                        Text("Total Devices : ${totalDevices.length}"),
                        const Divider(),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              final eachData = data[data.length-index-1];
                              return ListTile(
                                title: Text(
                                    eachData["deviceInfo"].toString(),
                                ),
                                subtitle: Text(
                                  "${(DateTime.tryParse(eachData["createdAt"].toString())??DateTime(2000)).toLocal()}"
                                ),
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
