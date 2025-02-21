import 'package:dio/dio.dart';
import 'package:movie_app/core/service/model.dart';

class ApiService {
  static final Dio dio = Dio();

  Future<List<MovieModel>> getMovies() async {
    const String url = 'https://imdb-top-100-movies.p.rapidapi.com/';
    const String apiKey = '74fd983b71mshbf1a5cb1b0f73e9p129500jsn056b2667c260';

    try {
      final response = await dio.get(
        url,
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
}
