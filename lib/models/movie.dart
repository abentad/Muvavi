class Movie {
  final String title;
  final String description;

  Movie({this.title, this.description});

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      title: map['results'][0]['original_title'],
      description: map['results'][0]['overview'],
    );
  }
}
