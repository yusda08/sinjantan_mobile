import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastDanger(String msg) {
  Fluttertoast.showToast(msg: msg, backgroundColor: Colors.red);
}

toast(String msg) {
  Fluttertoast.showToast(msg: msg);
}
