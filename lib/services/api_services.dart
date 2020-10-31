import 'dart:convert';
import 'dart:io';

import 'package:Muvavi/models/movie.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //singletoning the ApiService class meaning only one object of this class is used throughout the app
  ApiService._instantiate();
  static final ApiService instance = ApiService._instantiate();

  //
  final String url =
      'https://api.themoviedb.org/3/discover/movie?api_key=6a7488641bbe2ddced8c119c6cc2d10d&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1';

  //
  String _nextPageToken = '';

  //
  //
  Future<List<Movie>> fetchMovies() async {
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      //S
      List<dynamic> moviesJson = data['results'];
      List<Movie> movies = [];
      //
      moviesJson.forEach(
        (json) {
          movies.add(
            Movie.fromMap(data['results']),
          );
        },
      );
      return movies;
      //
      //
    } else {
      //throw json.decode(response.body)['error']['message'];
      print('error');
    }
  }
}
