import 'package:app_show/models/episodes.dart';
import 'package:app_show/models/movie.dart';
import 'package:app_show/models/listepisodes.dart';
import 'package:app_show/models/season.dart';
import 'package:flutter/material.dart';

class CardSeason extends StatelessWidget {
  Season season;
  CardSeason(this.season);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Season ${season.number}",
              style: const TextStyle(color: Colors.white)),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: showEpisodes(season.episodes),
              ))
        ],
      ),
    );
  }
}
