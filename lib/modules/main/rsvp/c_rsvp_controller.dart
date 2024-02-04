import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_app/constants/app_functions.dart';
import '../../../services/api_services.dart';
import '../../../services/dialog/dialog_service.dart';

class RsvpController extends GetxController{
  TextEditingController txtName = TextEditingController(text: "");
  TextEditingController txtPhone = TextEditingController(text: "");
  TextEditingController txtNotes = TextEditingController(text: "");
  ValueNotifier<int> totalPeople = ValueNotifier(1);


  Future<void> onClickAccept() async{
    if(txtName.text.isEmpty){
      DialogService().showTransactionDialog(text: "Please enter your name");
    }
    else if(txtPhone.text.isEmpty){
      DialogService().showTransactionDialog(text: "Please write something you wanna say!");
    }
    else{
      DialogService().showTransactionDialog(
        onClickYes: () async{
          DialogService().showLoadingDialog();
          final response = await http.post(
              Uri.parse("${ApiServices.baseUrl}/reserve"),
              headers: ApiServices.headers,
              body: jsonEncode(
                  {
                    "phone" : txtPhone.text,
                    "name" : txtName.text,
                    "numberOfPeople" : totalPeople.value,
                    "note" : txtNotes.text,
                  }
              )
            // body: jsonEncode({"deviceInfo" : deviceId})
          );
          DialogService().dismissDialog();
          if(response.statusCode == 200 || response.statusCode ==201){
            DialogService().showTransactionDialog(text: "Success! Thank you so much for supporting us");
          }
          else{
            superPrint(
              response.body,
              title: response.statusCode
            );
            DialogService().showTransactionDialog(text: "Something went wrong, please try again!");
          }
        },
        text: "${txtName.text}(${txtPhone.text}) will be reserved for ${totalPeople.value} people at our wedding. If this info is correct, please submit to continue!",
        yesButtonText: "Submit",
      );
    }
  }

}