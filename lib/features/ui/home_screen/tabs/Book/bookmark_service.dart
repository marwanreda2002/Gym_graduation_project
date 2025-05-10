import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../../core/utils/bookmark_item.dart';

class BookmarkService {
  final String baseUrl = 'https://your-api.com/tainers';

  Future<List<BookmarkItem>> fetchBookmarks(String userId) async {
    final Uri uri = Uri.parse('$baseUrl/users/$userId/bookmarks');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => BookmarkItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bookmarks');
    }
  }

  Future<void> addBookmark(String userId, String classId) async {
    final Uri uri = Uri.parse('$baseUrl/users/$userId/bookmarks');
    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'classId': classId,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add bookmark');
    }
  }

  Future<void> removeBookmark(String userId, String classId) async {
    final Uri uri = Uri.parse('$baseUrl/users/$userId/bookmarks/$classId');
    final response = await http.delete(uri);

    if (response.statusCode != 204) {
      throw Exception('Failed to remove bookmark');
    }
  }
}
