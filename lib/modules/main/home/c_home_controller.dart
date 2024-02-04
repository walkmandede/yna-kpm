import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_app/services/dialog/dialog_service.dart';
import 'package:http/http.dart' as http;

import '../../../constants/app_functions.dart';
import '../../../services/api_services.dart';

class HomeController extends GetxController{
  ValueNotifier<bool> xInitialVisit = ValueNotifier(true);
  ValueNotifier<bool> xDialogOpen = ValueNotifier(false);

  TextEditingController txtName = TextEditingController(text: "");
  TextEditingController txtWish = TextEditingController(text: "");

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

  Future<void> initLoad() async{

  }

  Future<void> onClickSend() async{
    if(txtName.text.isEmpty){
      DialogService().showTransactionDialog(text: "Please enter your name");
    }
    else if(txtWish.text.isEmpty){
      DialogService().showTransactionDialog(text: "Please write something you wanna say!");
    }
    else{
      DialogService().showLoadingDialog();
      final response = await http.post(
          Uri.parse("${ApiServices.baseUrl}/wish"),
          headers: ApiServices.headers,
          body: jsonEncode(
            {
              "wish" : txtWish.text,
              "name" : txtName.text
            }
          )
        // body: jsonEncode({"deviceInfo" : deviceId})
      );
      DialogService().dismissDialog();
      if(response.statusCode == 200 || response.statusCode ==201){
        DialogService().showTransactionDialog(text: "Success! Thank you so much for supporting us");
      }
      else{
        DialogService().showTransactionDialog(text: "Something went wrong, please try again!");
      }
    }
  }

}