import 'package:app_show/widget/wmovie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Widget> Shows(data) {
  List<Widget> listShow = [];
 
  for (var element in data) {
      listShow.add(Wmovie(element));
      
  }

  return listShow;
}
