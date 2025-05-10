class BookmarkItem {
  final String title;
  final String trainer;
  final String time;
  final String date;
  final String price;
  final String spotsLeft;
  final String imagePath;

  BookmarkItem({
    required this.title,
    required this.trainer,
    required this.time,
    required this.date,
    required this.price,
    required this.spotsLeft,
    required this.imagePath,
  });

  factory BookmarkItem.fromJson(Map<String, dynamic> json) {
    return BookmarkItem(
      title: json['title'] ?? '',
      trainer: json['trainer'] ?? '',
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      price: json['price'] ?? '',
      spotsLeft: json['spotsLeft'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
