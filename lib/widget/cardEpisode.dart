import 'package:app_show/models/episodes.dart';
import 'package:app_show/models/listepisodes.dart';
import 'package:flutter/material.dart';

class CardEpisode extends StatelessWidget {
  Episode episode;
  CardEpisode(this.episode);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 20.0,
      height: 1.0,
      child: Center(
        child: Column(
          children: [
            Image.network(
              episode.image,
              height: 200,
              width: 200,
            ),
            Text(
              episode.number + ". " + episode.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
      onPressed: () {
         Navigator.pushNamed(context, '/episode', arguments: episode);
      },
    );
  }
}
