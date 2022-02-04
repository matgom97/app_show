import 'package:app_show/widget/cardEpisode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<Widget> showEpisodes(data) {
  List<Widget> listepisodes = [];
  for (var element in data) {
      listepisodes.add(CardEpisode(element));
  }

  return listepisodes;
}
