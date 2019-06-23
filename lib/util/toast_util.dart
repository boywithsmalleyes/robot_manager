import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class ToastUtil {


  void showToast(BuildContext context, String content){
    Toast.show(content, context, duration: 3);
  }
}