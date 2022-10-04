import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/text.dart';
import 'package:flutter_application_1/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  final String apikey = 'c6513cf22688c5d707568c75b50cc796';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNjUxM2NmMjI2ODhjNWQ3MDc1NjhjNzViNTBjYzc5NiIsInN1YiI6IjYzMzQ0YzE3N2YwNTQwMDA4NDJjZmFjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0MgfYcc0bEUeQQKEJqRws49wpI2lgbBYSnqCf7slcEE';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();

    setState(() {
      trendingmovies = trendingresult['results'];
    });

    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(
          text: 'Flutter Film',
          color: Colors.blue,
          size: 35,
        ),
      ),
      body: ListView(
        children: [TrendingMovies(trending: trendingmovies)],
      ),
    );
  }
}
