import 'package:flutter/material.dart';

import '../components/trending_movies.dart';
import '../components/top_rated.dart';
import '../components/upcoming_movies.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Trending Movies',
              style: TextStyle(fontSize: 18.0),
            ),
            TrendingMovies(),
            Text(
              'Top Rated Movies',
              style: TextStyle(fontSize: 18.0),
            ),
            TopRated(),
            Text(
              'Upcoming Movies',
              style: TextStyle(fontSize: 18.0),
            ),
            UpcomingMovies(),
          ],
        ),
      ),
    );
  }
}
