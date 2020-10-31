class Movie {
  final String title;
  final String overview;
  final String posterImage;

  Movie({this.title, this.overview, this.posterImage});
}
//old
// class Movie {
//   final String title;
//   final String description;

//   Movie({this.title, this.description});

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       title: json['results'][0]['original_title'],
//       description: json['results'][0]['overview'],
//     );
//   }

//   // factory Movie.fromMap(Map<String, dynamic> map) {
//   //   return Movie(
//   //     title: map['results'][0]['original_title'],
//   //     description: map['results'][0]['overview'],
//   //   );
//   // }
// }

// // title: map['results'][0]['original_title'],
// // description: map['results'][0]['overview'],
