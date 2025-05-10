class ClassItem {
  final String title;
  final String trainer;
  final String time;
  final String date;
  final String price;
  final String spotsLeft;
  final String imagePath;
  final String description;
  final String type;

  ClassItem({
    required this.title,
    required this.trainer,
    required this.time,
    required this.date,
    required this.price,
    required this.spotsLeft,
    required this.imagePath,
    required this.description,
    required this.type,
  });

  factory ClassItem.fromJson(Map<String, dynamic> json) {
    return ClassItem(
      title: json['title'] ?? '',
      trainer: json['trainer'] ?? '',
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      price: json['price'] ?? '',
      spotsLeft: json['spotsLeft'] ?? '',
      imagePath: json['imagePath'] ?? '',
      description: json['description'] ?? '',
      type: json['type'] ?? '',
    );
  }
}
