import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/cast.dart';

Future<Cast> fetchCasts(movieId) async {
  final String keyVar = DotEnv().env['MOVIE_KEY'];
  final response = await http
      .get("https://api.themoviedb.org/3/movie/$movieId/casts?api_key=$keyVar");
  if (response.statusCode == 200) {
    return Cast.fromJson(json.decode(response.body));
  } else {
    throw Exception('not able to Fetch the trening Movies');
  }
}

class Actors extends StatefulWidget {
  final int movieId;
  Actors(this.movieId);
  @override
  _ActorsState createState() => _ActorsState(movieId);
}

class _ActorsState extends State<Actors> {
  int movieId;
  _ActorsState(movieId) {
    this.movieId = movieId;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchCasts(this.movieId),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Image.asset('assets/images/loading.gif'),
          );
        } else {
          final List castData = snapshot.data.cast;
          castData.removeWhere((item) => item['profile_path'] == null);
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: castData.length,
              itemBuilder: (context, index) {
                final String actorImage = castData[index]['profile_path'];
                final String actorName = castData[index]['name'];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/loading.gif',
                              image:
                                  'http://image.tmdb.org/t/p/w780/$actorImage'),
                        ),
                        Text(
                          actorName,
                          style: TextStyle(
                              fontSize: 11.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
