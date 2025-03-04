import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/service/DetailsModel.dart';
import 'package:movie_app/resources/TextStyles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../core/service/ApiService.dart';
import '../../../resources/Color_Manager.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key, required this.rank});
  int rank;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String videoUrl = "https://www.youtube.com/watch?v=uYPbbksJxIg";
  late YoutubePlayerController _controller;
  MovieDetails? movieDetails;
  bool isLoading = false;
  String errorMessage = "";
  Future<void> fetchMovieDetails() async {
    final details = await ApiService().getMovieDetails(widget.rank);
    try {
      setState(() {
        movieDetails = details;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMovieDetails();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void _showVideoPopup() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
        child: Container(
          width: 300.w,
          height: 400.h,
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 430.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: ColorManager.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            if (isLoading)
              Center(child: CircularProgressIndicator())
            else if (errorMessage.isNotEmpty)
              Center(
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red, fontSize: 16.sp),
                ),
              )
            else
              Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(movieDetails?.title ?? "No Title",
                            style: TextStyles.movierating),
                        Row(
                          children: const [
                            Icon(Icons.star,
                                color: ColorManager.secondaryColor),
                            Text('9.3', style: TextStyles.movierating),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      movieDetails?.description ?? "No description available.",
                      style: TextStyles.moviedescription,
                    ),
                    SizedBox(height: 10.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(5.r),
                        backgroundColor: ColorManager.secondaryColor,
                      ),
                      onPressed: _showVideoPopup,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow,
                            color: ColorManager.primaryColor,
                            size: 30,
                          ),
                          Text(
                            'Play Trailer',
                            style: TextStyles.Textbutton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
