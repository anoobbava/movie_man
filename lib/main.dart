import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'components/trending_movies.dart';
import 'components/top_rated.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pink[200]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
