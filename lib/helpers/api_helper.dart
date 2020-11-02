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
    for (var u in items) {
      Movie movie = Movie(
        title: u['original_title'],
        overview: u['overview'],
        posterImage: u['poster_path'],
        id: u['id'],
        voteAverage: u['vote_average'].toString(),
        releaseDate: u['release_date'],
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

//
//
// Genres
// Action          28
// Adventure       12
// Animation       16
// Comedy          35
// Crime           80
// Documentary     99
// Drama           18
// Family          10751
// Fantasy         14
// History         36
// Horror          27
// Music           10402
// Mystery         9648
// Romance         10749
// Science Fiction 878
// TV Movie        10770
// Thriller        53
// War             10752
// Western         37
