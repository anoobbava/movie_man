import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'components/trending_movies.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                'Trending Movies',
                style: TextStyle(fontSize: 18.0),
              ),
              Container(
                child: TrendingMovies(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
