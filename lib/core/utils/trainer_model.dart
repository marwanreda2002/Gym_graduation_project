class Trainer {
  final String name;
  final String imagePath;
  final double rating;
  final int reviews;

  Trainer({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.reviews,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      name: json['name'],
      imagePath: json['imagePath'],
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'],
    );
  }
}
