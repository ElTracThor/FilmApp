import 'package:flutter/material.dart';
import 'package:flutter_application_1/description.dart';
import 'package:flutter_application_1/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          modified_text(
            text: 'Films En Tendances ⭐',
            color: Colors.blue,
            size: 26,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 700,
            child: ListView.builder(
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    description: trending[index]['overview'],
                                    launch_on: trending[index]['release_date'],
                                    name: trending[index]['title'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    runtime:
                                        trending[index]['runtime'].toString(),
                                  )));
                    },
                    child: trending[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 400,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  trending[index]
                                                      ['poster_path']))),
                                ),
                                Container(
                                  child: modified_text(
                                    text: trending[index]['title'] != null
                                        ? trending[index]['title']
                                        : 'Chargement',
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
