
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppWidgets{


  static InputBorder textFieldBorder(){
    return OutlineInputBorder(       
      borderSide: BorderSide(color: AppColors.brown,),
      borderRadius: BorderRadius.circular(15)
    );
  }

}