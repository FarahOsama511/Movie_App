import 'package:flutter/material.dart';
import 'package:movie_app/core/service/ApiService.dart';
import 'package:movie_app/core/service/model.dart';

class Topfilms extends StatefulWidget {
  const Topfilms({super.key});

  @override
  State<Topfilms> createState() => _TopfilmsState();
}

ApiService apiService = ApiService();

class _TopfilmsState extends State<Topfilms> {
  List<MovieModel> movies = [];
  List<MovieModel> TopMovies = [];
  Future<void> _fetchMovies() async {
    List<MovieModel> fetchedMovies = await apiService.getMovies();

    if (mounted) {
      setState(() {
        movies = fetchedMovies;
        TopMovies = movies.take(10).toList();
      });
    }
  }

  @override
  void initState() {
    _fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: TopMovies.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Image.network(
              "${TopMovies[index].image}",
            ),
          );
        },
      ),
    );
  }
}
