import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Detail extends StatelessWidget {
  final Map movieData;
  Detail(this.movieData);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final String _posterPath = this.movieData['poster_path'];
    final String _titlePath = this.movieData['backdrop_path'];
    // final String _movieName = this.movieData['title'];
    final String movieName = this.movieData['title'];
    final String movieOverview = this.movieData['overview'];
    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          child: AppBar(
            flexibleSpace: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: "http://image.tmdb.org/t/p/w780/$_titlePath",
              fit: BoxFit.cover,
            ),
          ),
        ),
        preferredSize: Size.fromHeight(size.height / 3),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10.0),
          Text(
            movieName,
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            movieOverview,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.check,
                size: 25.0,
              ),
              Icon(
                FontAwesomeIcons.shareAlt,
                size: 25.0,
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('My List'),
              Text('Share'),
            ],
          ),
          SizedBox(height: 10.0),
          // Display Cast
        ],
      ),
    );
  }
}
