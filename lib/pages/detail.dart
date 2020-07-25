import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final Map movieData;
  Detail(this.movieData);
  @override
  Widget build(BuildContext context) {
    final String _posterPath = this.movieData['poster_path'];
    final String _movieName = this.movieData['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$_movieName'),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: '$_posterPath',
          child: Center(
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: "http://image.tmdb.org/t/p/w780/$_posterPath"),
          ),
        ),
      ),
    );
  }
}
