import 'package:Muvavi/helpers/api_helper.dart';
import 'package:Muvavi/models/casts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipedetector/swipedetector.dart';

class DetailsScreen extends StatefulWidget {
  final String imagePath;
  final String title;
  final String voteAverage;
  final int heroTagid;
  final String overView;
  final String releaseDate;
  final int movieId;

  DetailsScreen({
    this.imagePath,
    this.heroTagid,
    this.overView,
    this.title,
    this.voteAverage,
    this.releaseDate,
    this.movieId,
  });
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String posterBaseUrl = 'https://image.tmdb.org/t/p/w500';

  ApiHelper apiHelper = ApiHelper();
  int id = 1;

  List<Cast> casts = [];

  @override
  void initState() {
    super.initState();
    getCasts();
  }

  void getCasts() async {
    List<Cast> movieCasts = [];
    movieCasts = await apiHelper.getCasts(widget.movieId);

    print(casts.length);
    print('got all casts');
    setState(() {
      casts.addAll(movieCasts);
    });
    print('added all casts');
    print(casts.length);
  }

  @override
  Widget build(BuildContext context) {
    //
    final size = MediaQuery.of(context).size;
    //
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero(
              // tag: 'image' + widget.heroTagid.toString(),
              Container(
                height: size.height / 1.6,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      posterBaseUrl + widget.imagePath,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                // child: SwipeDetector(
                // onSwipeDown: () {
                //   Navigator.pop(context);
                // },
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black12.withOpacity(0.2),
                        Colors.black12.withOpacity(0.2),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: 15.0),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Center(
                                child: Text(
                                  widget.voteAverage,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.favorite,
                              size: 40.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              widget.releaseDate,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: widget.overView.length > 180
                    ? size.height / 2
                    : size.height / 4,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 20.0),
                      child: Text(
                        'Synopsis',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.overView,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  'Casts',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              casts == null
                  ? Center(child: CircularProgressIndicator())
                  : Container(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: casts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Container(
                              height: 200,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    posterBaseUrl + casts[index].profileImgPath,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

// Container(
//                 height: size.height / 2,
//                 width: size.width,
//                 decoration: BoxDecoration(
//                   color: Color(0xfff7f7f7),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 10.0, left: 20.0),
//                       child: Text(
//                         'Casts',
//                         style: GoogleFonts.montserrat(
//                           textStyle: TextStyle(
//                             fontSize: 22.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10.0),
//                     Container(
//                       // color: Colors.purple,
//                       height: 300,
//                       width: double.infinity,
//                       child: ListView.builder(
//                         physics: BouncingScrollPhysics(),
//                         scrollDirection: Axis.horizontal,
//                         itemCount: casts.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             color: Colors.orange,
//                             padding: EdgeInsets.only(left: 20.0),
//                             height: 100,
//                             width: 400,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   child: Container(
//                                     height: 100,
//                                     // width: 200,
//                                     decoration: BoxDecoration(
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.red,
//                                           offset: Offset(2, 7),
//                                           blurRadius: 20.0,
//                                         ),
//                                       ],
//                                       image: DecorationImage(
//                                         image: NetworkImage(posterBaseUrl +
//                                             casts[index].profileImgPath),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
// SwipeDetector(
//     child: ... //You Widget Tree here
//     ),
//     onSwipeUp: () {
//         setState(() {
//             _swipeDirection = "Swipe Up";
//         });
//     },
//     onSwipeDown: () {
//         setState(() {
//             _swipeDirection = "Swipe Down";
//         });
//     },
//     onSwipeLeft: () {
//       setState(() {
//         _swipeDirection = "Swipe Left";
//       });
//     },
//     onSwipeRight: () {
//       setState(() {
//         _swipeDirection = "Swipe Right";
//       });
//     },
// )
