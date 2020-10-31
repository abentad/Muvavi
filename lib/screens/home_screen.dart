import 'dart:convert';

import 'package:Muvavi/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String url =
      'https://api.themoviedb.org/3/discover/movie?api_key=6a7488641bbe2ddced8c119c6cc2d10d&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=';

  //
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w200';
  //
  String page = '1';

  Future<List<Movie>> _getMovies(String pageNumber) async {
    var response = await http.get(url + pageNumber);
    var jsonData = jsonDecode(response.body);
    var items = jsonData['results'];

    List<Movie> movies = [];
    //
    for (var u in items) {
      Movie movie = Movie(
        title: u['original_title'],
        overview: u['overview'],
        posterImage: u['poster_path'],
      );
      movies.add(movie);
    }

    print(movies.length);
    return movies;
  }

  @override
  void initState() {
    super.initState();
    _getMovies(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getMovies(page),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    leading: Image(
                      image: NetworkImage(
                        posterBaseUrl + snapshot.data[index].posterImage,
                      ),
                    ),
                    title: Text(
                      snapshot.data[index].title,
                    ),
                    subtitle: Text(
                      snapshot.data[index].overview,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
