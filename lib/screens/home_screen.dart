import 'dart:convert';

import 'package:Muvavi/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  bool _isLoading = false;

  List<Movie> movies = [];

  Future<List<Movie>> _getMovies(String pageNumber) async {
    var response = await http.get(url + pageNumber);
    var jsonData = jsonDecode(response.body);
    var items = jsonData['results'];

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

    //
    List<String> titles = [];
    for (var movie in movies) {
      titles.add(movie.title);
    }
    print(titles);

    return movies;
  }

  _loadMoreMovies() async {
    _isLoading = true;
    print('loadig more movies....');
    setState(() {
      page = (int.parse(page) + 1).toString();
    });
    List<Movie> moreMovies = await _getMovies((int.parse(page) + 1).toString());
    setState(() {
      page = (int.parse(page) + 1).toString();
    });
    print('done');
    // List<Movie> allMovies = movies..addAll(moreMovies);
    setState(() {
      movies.followedBy(moreMovies);
    });
    print('loading done.');
    // print(movies);
    _isLoading = false;
  }

  @override
  void initState() {
    super.initState();
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
                SizedBox(height: 5.0),
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
          future: _getMovies('1'),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollDetails) {
                  if (!_isLoading &&
                      scrollDetails.metrics.pixels ==
                          scrollDetails.metrics.maxScrollExtent) {
                    _loadMoreMovies();
                  }
                  return false;
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                            child: Text(
                              'Muvavi',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, bottom: 30.0),
                            child: Row(
                              children: [
                                Text("Powered By "),
                                SizedBox(width: 10.0),
                                // SvgPicture.asset(
                                //   'assets/images/tmdb.svg',
                                //   height: 20,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return _buildUi(snapshot, index - 1);
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
