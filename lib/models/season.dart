import 'episodes.dart';
import 'movie.dart';

class Season {
  String id;
  String number;
  Movie movie;
  List<Episode> episodes;
  Season(this.id, this.number, this.movie, this.episodes);
}
