import 'package:Muvavi/models/movie.dart';
import 'package:flutter/material.dart';

class UiHelper {
  //
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w200';

  //
  //
  //title at top
  buildTitle() {
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

  buildUi(List<Movie> movieList, int index, BuildContext context) {
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
              posterBaseUrl + movieList[index].posterImage,
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.0),
                Text(
                  movieList[index].title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      movieList[index].overview.toString().length > 100
                          ? movieList[index]
                                  .overview
                                  .toString()
                                  .substring(0, 100) +
                              '...'
                          : movieList[index].overview,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
