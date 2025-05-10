import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_details_model.dart';

class TrainerService {
  static Future<List<Trainer>> fetchTrainers() async {
    final response = await http.get(Uri.parse('https://your-api.com/trainers'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((trainer) => Trainer.fromJson(trainer)).toList();
    } else {
      throw Exception('Error fetching trainers');
    }
  }

  static Future<TrainerDetails> fetchTrainerDetails(int trainerId) async {
    final response = await http
        .get(Uri.parse('https://your-api.com/trainers/$trainerId/details'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return TrainerDetails.fromJson(data);
    } else {
      throw Exception('Error fetching trainer details');
    }
  }

  static Future<List<Technique>> fetchTechniques() async {
    final response =
    await http.get(Uri.parse('https://your-api.com/techniques'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((technique) => Technique.fromJson(technique)).toList();
    } else {
      throw Exception('Error fetching techniques');
    }
  }
  //دالة التقيم
  static Future<void> submitRating(int trainerId, RatingData ratingData) async {
    final response = await http.post(
      Uri.parse('https://your-api.com/trainers/$trainerId/rate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'rating': ratingData.rating,
        'comment': ratingData.comment,
      }),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Error submitting rating');
    }
  }
}
