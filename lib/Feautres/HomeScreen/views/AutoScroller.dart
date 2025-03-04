import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/core/service/ApiService.dart';
import 'package:movie_app/core/service/model.dart';

class Autoscroller extends StatefulWidget {
  const Autoscroller({super.key});

  @override
  State<Autoscroller> createState() => _AutoscrollerState();
}

class _AutoscrollerState extends State<Autoscroller> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  List<MovieModel> movies = [];
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    List<MovieModel> fetchedMovies = await apiService.getMovies();

    if (mounted) {
      setState(() {
        movies = fetchedMovies;
      });

      if (movies.isNotEmpty) {
        _startAutoScroll();
      }
    }
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        double newOffset = _scrollController.offset + 310;
        double maxScroll = _scrollController.position.maxScrollExtent;
        _scrollController.animateTo(
          newOffset >= maxScroll ? 0 : newOffset,
          duration: const Duration(seconds: 3),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 300,
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    "${movies[index].image}",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                          child: Icon(Icons.broken_image, color: Colors.white));
                    },
                  ),
                );
              },
            ),
    );
  }
}
