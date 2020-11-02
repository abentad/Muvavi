import 'package:Muvavi/models/movie.dart';
import 'package:Muvavi/screens/details_screen.dart';
import 'package:Muvavi/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UiHelper {
  //
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';
  var herotag = 0;

  //
  //
  //title at top
  buildTitle() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Movies',
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
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
          child: Row(
            children: [
              Text("Powered By "),
              SizedBox(width: 10.0),
              SvgPicture.asset(
                'assets/images/tmdb.svg',
                height: 20,
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
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
      padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
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
        child: Hero(
          tag: 'image' + herotag.toString(),
          child: MyContainer(
            imagePath: posterBaseUrl + movieList[index].posterImage,
            title: movieList[index].title,
            voteAverage: movieList[index].voteAverage,
          ),
        ),
      ),
    );
  }
}

// Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
//           child: Text(
//             'Muvavi',
//             style: TextStyle(
//               fontSize: 40.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 10.0, bottom: 30.0),
//           child: Row(
//             children: [
//               Text("Powered By "),
//               SizedBox(width: 10.0),
//               // SvgPicture.asset(
//               //   'assets/images/tmdb.svg',
//               //   height: 20,
//               // ),
//             ],
//           ),
//         ),
//       ],
//     );

// Container(
//       margin: EdgeInsets.all(10.0),
//       height: MediaQuery.of(context).size.height / 4,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(
//             20.0,
//           ),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(1, 9),
//             blurRadius: 20,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Image(
//             fit: BoxFit.cover,
//             image: NetworkImage(
//               posterBaseUrl + movieList[index].posterImage,
//             ),
//           ),
//           SizedBox(width: 20.0),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 5.0),
//                 Text(
//                   movieList[index].title,
//                   overflow: TextOverflow.clip,
//                   style: TextStyle(
//                     fontSize: 24.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical,
//                     child: Text(
//                       movieList[index].overview.toString().length > 100
//                           ? movieList[index]
//                                   .overview
//                                   .toString()
//                                   .substring(0, 100) +
//                               '...'
//                           : movieList[index].overview,
//                       overflow: TextOverflow.clip,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
