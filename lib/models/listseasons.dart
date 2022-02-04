
import 'package:app_show/widget/cardSeason.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Widget> season(data) {
  List<Widget> listSeason = [];
  for (var element in data) {
      listSeason.add(CardSeason(element));
  }

  return listSeason;
}
