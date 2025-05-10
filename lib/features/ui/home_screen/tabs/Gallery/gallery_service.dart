import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../core/utils/class_gallery_item.dart';

class GalleryService {
  final String baseUrl = 'https://your-api.com/Gallery';

  Future<List<GalleryItem>> fetchGalleryItems() async {
    final response = await http.get(Uri.parse('$baseUrl/gallery'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => GalleryItem(imageUrl: item['image_url']))
          .toList();
    } else {
      throw Exception('Failed to load gallery');
    }
  }
}
