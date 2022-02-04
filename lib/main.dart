import 'package:app_show/widget/detailEpisode.dart';
import 'package:app_show/widget/seconscreen.dart';
import 'widget/appbar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/movie.dart';
import 'models/listshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TVmovie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(
              title: 'TVmovie',
            ),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => DetailMovie(),
        '/episode': (context) => DetailEpisode()
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Movie>> response;
  @override
  void initState() {
    super.initState();
    response = getRequest();
  }

  Future<List<Movie>> getRequest() async {
    //replace your restFull API here.
    String url = "https://api.tvmaze.com/shows?page=1";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      //Creating a list to store input data;
      List<Movie> Movies = [];
      for (var singleMovie in responseData) {
        //Adding Movie to the list.
        Movies.add(Movie(
            singleMovie["id"].toString(),
            singleMovie["image"]["medium"],
            singleMovie["name"],
            singleMovie["summary"]));
      }

      return Movies;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: titulo(),
        actions: [texto()],
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: response,
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                crossAxisCount: 4,
                scrollDirection: Axis.horizontal,
                children: Shows(snapshot.data),
              );
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
