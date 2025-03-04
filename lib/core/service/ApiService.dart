import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:movie_app/core/service/DetailsModel.dart';
import 'package:movie_app/core/service/model.dart';

class ApiService {
  static final Dio dio = Dio();
  final String _baseurl = 'https://imdb-top-100-movies.p.rapidapi.com/';
  String apiKey = '5f08e56ca5mshf58ec834e4202d7p1876a6jsn0b4bae4476e8';

  Future<List<MovieModel>> getMovies() async {
    try {
      final response = await dio.get(
        _baseurl,
        options: Options(
          headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<MovieModel> movies = (response.data as List)
            .map((item) => MovieModel.fromJson(item))
            .toList();
        print(response.data);
        return movies;
      } else {
        throw Exception(
            "Failed to load movies, status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      throw Exception(
          "Failed to fetch movies: ${e.response?.statusCode} ${e.message}");
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception("Unexpected error occurred: $e");
    }
  }

  Future<MovieDetails> getMovieDetails(int rank) async {
    String url = "${_baseurl}top$rank";
    try {
      final response = await dio.get(url,
          options: Options(headers: {
            'X-RapidAPI-Key': apiKey,
            'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com',
          }));
      if (response.statusCode == 200) {
        print(response.data);
        return MovieDetails.fromJson(json.decode(response.data));
      } else {
        throw Exception(
            "Failed to load movies, status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      print("Dio error: ${e.message}");
      throw Exception(
          "Failed to fetch movies: ${e.response?.statusCode} ${e.message}");
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception("Unexpected error occurred: $e");
    }
  }
}
