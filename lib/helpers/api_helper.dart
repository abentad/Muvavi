import 'dart:convert';

import 'package:Muvavi/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  //
  List<Movie> allMovies = [];

  final String url =
      'https://api.themoviedb.org/3/discover/movie?api_key=6a7488641bbe2ddced8c119c6cc2d10d&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=';
  //
  //
  Future<List<Movie>> getMovies(String pageNumber) async {
    List<Movie> movies = [];

    var response = await http.get(url + pageNumber);
    var jsonData = jsonDecode(response.body);
    var items = jsonData['results'];

    //
    // List<int> _getGenres(var item) {
    //   var genres = jsonData['results[' + item + '].genre_ids'];
    //   List<int> movieGenre = [];
    //   for (var genre in genres) {
    //     movieGenre.add(genre);
    //   }
    //   return movieGenre;
    // }

    for (var u in items) {
      Movie movie = Movie(
        title: u['original_title'],
        overview: u['overview'],
        posterImage: u['poster_path'],
        id: u['id'],
        voteAverage: u['vote_average'].toString(),
        releaseDate: u['release_date'],
        // genres: _getGenres(u),
      );

      // setState(() {
      movies.add(movie);
      // });
    }

    //
    allMovies.addAll(movies);
    print('all movies: ' + allMovies.length.toString());
    //this is just to print the titles
    List<String> titles = [];
    for (var movie in movies) {
      titles.add(movie.title);
    }
    print('new added');
    print(titles);
    //

    return movies;
  }
}
