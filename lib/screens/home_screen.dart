import 'package:Muvavi/models/movie.dart';
import 'package:Muvavi/services/api_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [];
  @override
  void initState() async {
    super.initState();
    movies = await ApiService.instance.fetchMovies();
  }

  _buildMovies() {
    movies.forEach(
      (movie) {
        return Container(
          height: 150.0,
          width: double.infinity,
          child: Column(
            children: [
              Text(
                movie.title,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                movie.description,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movies == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                if (index <= movies.length) {
                  return _buildMovies();
                }
                return null;
              },
            ),
    );
  }
}
