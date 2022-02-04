import 'package:app_show/models/movie.dart';
import 'package:app_show/widget/seconscreen.dart';
import 'package:flutter/material.dart';

class Wmovie extends StatelessWidget {
  Movie movie;
  Wmovie(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: MaterialButton(
        minWidth: 20.0,
        height: 1.0,
        child: Image.network(
          movie.image,
          height: 200,
          width: 200,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/second', arguments: movie);
        },
      ),
    );
  }
}
