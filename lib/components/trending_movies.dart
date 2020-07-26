import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/trending.dart';
import './horizontal_cards.dart';

Future<Trending> fetchMovies() async {
  final String keyVar = DotEnv().env['MOVIE_KEY'];
  final response = await http
      .get("https://api.themoviedb.org/3/trending/movie/day?api_key=$keyVar");
  if (response.statusCode == 200) {
    return Trending.fromJson(json.decode(response.body));
  } else {
    throw Exception('not able to Fetch the trening Movies');
  }
}

class TrendingMovies extends StatefulWidget {
  @override
  _TrendingMoviesState createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMovies(),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Image.asset('assets/images/loading.gif'),
          );
        } else {
          return HorizontalCards(snapshot.data.movies);
        }
      },
    );
  }
}
