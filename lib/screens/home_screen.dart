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

  _buildUi(AsyncSnapshot snapshot, int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: MediaQuery.of(context).size.height / 4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            20.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 9),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              posterBaseUrl + snapshot.data[index].posterImage,
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                Text(
                  snapshot.data[index].title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  snapshot.data[index].overview.toString().length > 100
                      ? snapshot.data[index].overview
                              .toString()
                              .substring(0, 100) +
                          '...'
                      : snapshot.data[index].overview,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (index == 0) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
                      child: Text(
                        'Muvavi',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return _buildUi(snapshot, index - 1);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
