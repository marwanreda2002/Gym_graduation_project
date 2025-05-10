class TrainerDetails {
  final SocialMedia social;
  final double rating;
  final int clients;
  final List<String> experience;
  final List<Technique> techniques;

  TrainerDetails({
    required this.social,
    required this.rating,
    required this.clients,
    required this.experience,
    required this.techniques,
  });

  factory TrainerDetails.fromJson(Map<String, dynamic> json) {
    return TrainerDetails(
      social: SocialMedia.fromJson(json['social']),
      rating: (json['rating'] as num).toDouble(),
      clients: json['clients'],
      experience: List<String>.from(json['experience']),
      techniques: (json['techniques'] as List)
          .map((e) => Technique.fromJson(e))
          .toList(),
    );
  }
}

class SocialMedia {
  final String facebook;
  final String instagram;
  final String whatsapp;

  SocialMedia({
    required this.facebook,
    required this.instagram,
    required this.whatsapp,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      facebook: json['facebook'],
      instagram: json['instagram'],
      whatsapp: json['whatsapp'],
    );
  }
}

class Technique {
  final String muscleGroup;
  final double rating;
  final int reviewCount;
  final List<Video> videos;

  Technique({
    required this.muscleGroup,
    required this.rating,
    required this.reviewCount,
    required this.videos,
  });

  factory Technique.fromJson(Map<String, dynamic> json) {
    return Technique(
      muscleGroup: json['muscleGroup'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      videos: (json['videos'] as List).map((v) => Video.fromJson(v)).toList(),
    );
  }
}

class Video {
  final String title;
  final String thumbnail;
  final String url;

  Video({
    required this.title,
    required this.thumbnail,
    required this.url,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      title: json['title'],
      thumbnail: json['thumbnail'],
      url: json['url'],
    );
  }
}

class RatingData {
  final double rating;
  final String comment;

  RatingData({required this.rating, required this.comment});
}
