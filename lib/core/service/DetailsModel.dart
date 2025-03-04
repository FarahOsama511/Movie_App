class MovieDetails {
  final int? rank;
  final String? title;
  final String? rating;
  // final String? id;
  // final int? year;
  final String? bigImage;
  final String? description;
  // final String? trailer;
  // final String? trailerEmbedLink;
  // final String? trailerYoutubeId;
  // final List<String>? genre;
  // final List<String>? director;
  // final List<String>? writers;

  MovieDetails({
    this.rank,
    this.title,
    this.rating,
    // this.id,
    // this.year,
    this.bigImage,
    this.description,
    // this.trailer,
    // this.trailerEmbedLink,
    // this.trailerYoutubeId,
    // this.genre,
    // this.director,
    // this.writers,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      rank: json["rank"],
      title: json["title"],
      rating: json["rating"],
      // id: json["id"],
      // year: json["year"],
      bigImage: json["big_image"],
      description: json["description"],
      // trailer: json["trailer"],
      // trailerEmbedLink: json["trailer_embed_link"],
      // trailerYoutubeId: json["trailer_youtube_id"],
      // genre: json["genre"] == null
      //     ? []
      //     : List<String>.from(json["genre"]!.map((x) => x)),
      // director: json["director"] == null
      //     ? []
      //     : List<String>.from(json["director"]!.map((x) => x)),
      // writers: json["writers"] == null
      //     ? []
      //     : List<String>.from(json["writers"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "title": title,
        "rating": rating,
        "big_image": bigImage,
        "description": description,
      };
}
       // "trailer": trailer,
        // "trailer_embed_link": trailerEmbedLink,
        // "trailer_youtube_id": trailerYoutubeId,
        // "genre": genre == null ? [] : List<dynamic>.from(genre!.map((x) => x)),
        // "director":
        //     director == null ? [] : List<dynamic>.from(director!.map((x) => x)),
        // "writers":
        //     writers == null ? [] : List<dynamic>.from(writers!.map((x) => x)),