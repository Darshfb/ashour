import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveIndicator extends StatelessWidget {
   AdaptiveIndicator({Key? key, required this.os}) : super(key: key);
String os;
  @override
  Widget build(BuildContext context) {
    if(os == 'android') {
      return const CircularProgressIndicator();
    } else{
      return const CupertinoActivityIndicator();
    }
  }
}
