class MovieModel {
  final String? title;
  final String ?description;
  final String? image;
  final String ?bigImage;
  final String? rating;
  MovieModel({
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.rating,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      bigImage: json['bigImage'],
      rating: json['rating'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'bigImage': bigImage,
      'rating': rating,
    };
  }
}
