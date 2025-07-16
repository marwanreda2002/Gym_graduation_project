class ClassModel {
  final String id;
  final String name;
  final String description;
  final String trainerName;
  final String imageUrl;
  final num price;
  final String timing;
  final int capacity;

  ClassModel({
    required this.id,
    required this.name,
    required this.description,
    required this.trainerName,
    required this.imageUrl,
    required this.price,
    required this.timing,
    required this.capacity,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      trainerName: json['trainerName'] as String,
      imageUrl: json['imageUrl'] as String,
      price: json['price'] as num,
      timing: json['timing'] as String,
      capacity: json['capacity'] as int,
    );
  }
}
