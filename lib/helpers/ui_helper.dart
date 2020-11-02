import 'package:Muvavi/models/movie.dart';
import 'package:Muvavi/screens/details_screen.dart';
import 'package:Muvavi/widgets/my_container.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiHelper {
  //
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';
  var herotag = 0;

  final double leftRightPadding = 20.0;

  //
  //
  //title at top
  buildTitle() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              left: leftRightPadding, right: leftRightPadding, top: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Muvavi',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.settings_outlined),
                  SizedBox(width: 25.0),
                  Icon(
                    Icons.supervised_user_circle,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: leftRightPadding, right: leftRightPadding, top: 10.0),
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
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(
              left: leftRightPadding, right: leftRightPadding, top: 30.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xffffa301),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Center(
                      child: Text(
                    'Now Showing',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Color(0xfff7f7f7),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6.0),
                      bottomRight: Radius.circular(6.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Coming soon',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  buildUi(List<Movie> movieList, int index, BuildContext context) {
    herotag++;
    return Padding(
      padding: EdgeInsets.only(
          left: leftRightPadding, right: leftRightPadding, top: 40.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20.0,
              offset: Offset(2, 10),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  imagePath: movieList[index].posterImage,
                  overView: movieList[index].overview,
                  title: movieList[index].title,
                  voteAverage: movieList[index].voteAverage,
                  releaseDate: movieList[index].releaseDate,
                  // heroTagid: herotag,
                ),
              ),
            );
          },
          child: MyContainer(
            imagePath: posterBaseUrl + movieList[index].posterImage,
            title: movieList[index].title,
            voteAverage: movieList[index].voteAverage,
            // genres: movieList[index].genres,
          ),
        ),
      ),
    );
  }
}

// MyContainer(
//           imagePath: posterBaseUrl + movieList[index].posterImage,
//           title: movieList[index].title,
//           voteAverage: movieList[index].voteAverage,
//         ),

// Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => DetailsScreen(
//                 imagePath: movieList[index].posterImage,
//                 overView: movieList[index].overview,
//                 title: movieList[index].title,
//                 voteAverage: movieList[index].voteAverage,
//                 releaseDate: movieList[index].releaseDate,
//                 // heroTagid: herotag,
//               ),
//             ),
//           );

//
//navigation with animation
// Navigator.push(
//               context,
//               PageRouteBuilder(
//                 transitionDuration: Duration(milliseconds: 100),
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   return ScaleTransition(
//                     scale: animation,
//                     alignment: Alignment.center,
//                     child: child,
//                   );
//                 },
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return DetailsScreen(
//                     imagePath: movieList[index].posterImage,
//                     overView: movieList[index].overview,
//                     title: movieList[index].title,
//                     voteAverage: movieList[index].voteAverage,
//                     releaseDate: movieList[index].releaseDate,
//                     // heroTagid: herotag,
//                   );
//                 },
//               ),
//             );

//working animation
// OpenContainer(
//         transitionDuration: Duration(milliseconds: 500),
//         closedBuilder: (context, action) {
//           return MyContainer(
//             imagePath: posterBaseUrl + movieList[index].posterImage,
//             title: movieList[index].title,
//             voteAverage: movieList[index].voteAverage,
//           );
//         },
//         openBuilder: (context, action) {
//           return DetailsScreen(
//             imagePath: movieList[index].posterImage,
//             overView: movieList[index].overview,
//             title: movieList[index].title,
//             voteAverage: movieList[index].voteAverage,
//             releaseDate: movieList[index].releaseDate,
//           );
//         },
//       ),
