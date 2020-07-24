import 'package:flutter/material.dart';

class TrendingMovies extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Card(
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: 'https://picsum.photos/250?image=$index',
              ),
            ),
          );
        },
      ),
    );
  }
}
