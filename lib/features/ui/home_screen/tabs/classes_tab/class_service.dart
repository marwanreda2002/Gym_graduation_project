import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../core/utils/class_item.dart';

class ClassService {
  Future<List<ClassItem>> fetchClasses(
      {String? type, String? date, String? startTime, String? endTime}) async {
    try {
      final Map<String, String> queryParams = {};
      if (type != null && type != 'All') {
        queryParams['type'] = type;
      }
      if (date != null) {
        queryParams['date'] = date;
      }
      if (startTime != null) {
        queryParams['start_time'] = startTime;
      }
      if (endTime != null) {
        queryParams['end_time'] = endTime;
      }

      final Uri uri = Uri.parse("https://your-api.com/class")
          .replace(queryParameters: queryParams);

      final response = await http.get(uri).timeout(const Duration(seconds: 5));

      print("Request URL: ${uri.toString()}");
      print("Status Code: ${response.statusCode}");
      print("Body: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => ClassItem.fromJson(json)).toList();
      } else {
        throw Exception(
            "Failed to load classes - Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error occurred: $e");
      throw Exception("Something went wrong: $e");
    }
  }
}
