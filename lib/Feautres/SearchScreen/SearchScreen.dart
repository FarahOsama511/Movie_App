import 'package:flutter/material.dart';
import 'package:movie_app/core/service/model.dart';
import 'package:movie_app/resources/Color_Manager.dart';

import '../../core/service/ApiService.dart';
import 'views/CustomTextField.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieModel> _allMovies = [];
  List<MovieModel> _filteredMovies = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    final apiService = ApiService();
    final Movies = await apiService.getMovies();
    setState(() {
      _allMovies = Movies;
      _filteredMovies = Movies;
      _isLoading = false;
    });
  }

  void _search(String query) {
    setState(() {
      _filteredMovies = _allMovies
          .where((movie) =>
              movie.title!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextField(
          icon: Icons.search,
          controller: _searchController,
          hintText: "Search..",
          onChanged: _search,
          onpressed: () => _search(_searchController.text),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _filteredMovies.isEmpty
              ? Center(child: Text('No results found'))
              : ListView.builder(
                  itemCount: _filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = _filteredMovies[index];
                    return ListTile(
                      title: Text(
                        movie.title!,
                        style: TextStyle(color: ColorManager.primaryColor),
                      ),
                      subtitle: Image.network("${movie.image}"),
                    );
                  },
                ),
    );
  }
}
