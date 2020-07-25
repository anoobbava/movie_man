class Trending {
  final List movies;
  Trending({this.movies});

  factory Trending.fromJson(Map<String, dynamic> json) {
    return Trending(
      movies: json['results'],
    );
  }
}
