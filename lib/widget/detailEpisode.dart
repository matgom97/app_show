import 'package:app_show/models/episodes.dart';
import 'package:flutter/material.dart';

class DetailEpisode extends StatefulWidget {
  @override
  State<DetailEpisode> createState() => _DetailEpisode();
}

class _DetailEpisode extends State<DetailEpisode> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Episode;
    return MaterialApp(
      home: Scaffold(
         backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.only(top: 20),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Text(
              args.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Image.network(args.image),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(args.summary, textAlign: TextAlign.justify,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ]),
        ),
      ),
    );
  }
}
