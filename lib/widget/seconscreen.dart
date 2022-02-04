import 'dart:convert';
import 'package:app_show/models/episodes.dart';
import 'package:app_show/models/listseasons.dart';
import 'package:app_show/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'appbar.dart';
import '../models/season.dart';

class DetailMovie extends StatefulWidget {
  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  late List<Season> seasons = [];
  late Future<List<Season>> response;
  @override
  static const notFound =
      "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg";
  static const empty = "EMPTY";
  Future<List<Episode>> getEpisodes(id) async {
    List<Episode> episodes = [];
    String url = "https://api.tvmaze.com/seasons/$id/episodes";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      for (var episode in responseData) {
        var name = episode["name"] == null ? empty : episode["name"];
        var number = episode["number"].toString() == null
            ? empty
            : episode["number"].toString();
        var season = episode["season"].toString() == null
            ? empty
            : episode["season"].toString();
        var image =
            episode["image"] == null ? notFound : episode["image"]["medium"];
        var summary = episode["summary"] == null ? empty : episode["summary"];
        episodes.add(Episode(name, number, season, summary, image));
      }
      return episodes;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Season>> getRequest(movie) async {
    //replace your restFull API here.
    String url = "https://api.tvmaze.com/shows/${movie.id}/seasons";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      for (var singleMovie in responseData) {
        var episodes = await getEpisodes(singleMovie["id"]);
        seasons.add(Season(singleMovie["id"].toString(),
            singleMovie["number"].toString(), movie, episodes));
      }
      return seasons;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Movie;
    print(args.id);
    Future<List<Season>> response = getRequest(args);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar:titulo(),
        
      
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: response,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView(scrollDirection: Axis.vertical, children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(args.name, style: const TextStyle(color: Colors.white)),
                    ),
                    Image.network(args.image),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(args.summary, style: const TextStyle(color: Colors.white)),
                    )
                  ],
                ),
                Column(
                  children: season(snapshot.data),
                ),
              ]);
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return const Text("error");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
