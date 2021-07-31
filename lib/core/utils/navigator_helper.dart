import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

push(context, Widget page) {
  return Navigator.push(context, CupertinoPageRoute(builder: (_) => page));
}

pushReplace(context, Widget page) {
  return Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (_) => page));
}
