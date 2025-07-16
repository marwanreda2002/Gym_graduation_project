class Trainer {
  final String name;
  final String imagePath;
  final double rating;
  final int reviews;
  final String bio;
  final String specialization;
  final int experienceYears;
  final int clientsCount;
  final List<String> certifications;
  final List<WorkExperience> workExperience;
  final Map<String, String> socialMedia;

  Trainer({
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.reviews,
    required this.bio,
    required this.specialization,
    required this.experienceYears,
    required this.clientsCount,
    required this.certifications,
    required this.workExperience,
    required this.socialMedia,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) {
    return Trainer(
      name: json['name'],
      imagePath: json['imagePath'],
      rating: (json['rating'] as num).toDouble(),
      reviews: json['reviews'],
      bio: json['bio'] ?? '',
      specialization: json['specialization'] ?? '',
      experienceYears: json['experienceYears'] ?? 0,
      clientsCount: json['clientsCount'] ?? 0,
      certifications: List<String>.from(json['certifications'] ?? []),
      workExperience: (json['workExperience'] as List? ?? [])
          .map((e) => WorkExperience.fromJson(e))
          .toList(),
      socialMedia: Map<String, String>.from(json['socialMedia'] ?? {}),
    );
  }
}

class WorkExperience {
  final String company;
  final String position;
  final String duration;
  final List<String> achievements;

  WorkExperience({
    required this.company,
    required this.position,
    required this.duration,
    required this.achievements,
  });

  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    return WorkExperience(
      company: json['company'],
      position: json['position'],
      duration: json['duration'],
      achievements: List<String>.from(json['achievements'] ?? []),
    );
  }
}
