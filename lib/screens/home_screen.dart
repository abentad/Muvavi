import 'package:Muvavi/helpers/api_helper.dart';
import 'package:Muvavi/helpers/ui_helper.dart';
import 'package:Muvavi/models/movie.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  //
  bool _isLoading = false;
  List<Movie> movies = [];
  String page = '1';

  //ui helper class instantiating
  UiHelper uiHelper = UiHelper();
  //
  ApiHelper apiHelper = ApiHelper();

  @override
  void initState() {
    super.initState();
    loadFirstBatchOfMovies();
  }

  loadFirstBatchOfMovies() async {
    List<Movie> firstMovies = [];
    firstMovies = await apiHelper.getMovies('1');
    setState(() {
      movies.addAll(firstMovies);
    });
  }

  loadMoreMovies() async {
    _isLoading = true;
    print('loadig more movies....');
    //
    setState(() {
      page = (int.parse(page) + 1).toString();
    });
    //new movies list
    List<Movie> moreMovies =
        await apiHelper.getMovies((int.parse(page) + 1).toString());
    // setState(() {
    movies.addAll(moreMovies);
    // });
    print('loading done.');
    //
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: movies.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollDetails) {
                  if (!_isLoading &&
                      scrollDetails.metrics.pixels ==
                          scrollDetails.metrics.maxScrollExtent) {
                    loadMoreMovies();
                  }
                  return false;
                },
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return uiHelper.buildTitle();
                    } else {
                      return uiHelper.buildUi(movies, index - 1, context);
                    }
                  },
                ),
              ),
      ),
    );
  }
}
