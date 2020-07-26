class Cast {
  final List cast;
  Cast({this.cast});

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      cast: json['cast'],
    );
  }
}
