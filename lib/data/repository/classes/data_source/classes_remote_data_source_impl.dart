import 'package:gym_app_graduation_project/core/api/api_manager.dart';
import 'package:gym_app_graduation_project/core/api/end_points.dart';
import 'package:gym_app_graduation_project/data/models/class_model.dart';
import 'package:gym_app_graduation_project/data/repository/classes/data_source/classes_remote_data_source.dart';

class ClassesRemoteDataSourceImpl implements ClassesRemoteDataSource {
  @override
  Future<List<ClassModel>> getClasses() async {
    try {
      final response = await ApiManager.getData(endPoint: EndPoints.classes);

      print('API Response: ${response.data}');

      // Handle different possible response structures
      List<dynamic> classesList;

      if (response.data is List) {
        // If the response is directly a list
        classesList = response.data;
      } else if (response.data['classes'] != null) {
        // If the response has a 'classes' key
        classesList = response.data['classes'];
      } else if (response.data['data'] != null) {
        // If the response has a 'data' key
        classesList = response.data['data'];
      } else {
        // If none of the above, try to use the response data as is
        classesList = [response.data];
      }

      print('Classes List: $classesList');

      return classesList.map((json) => ClassModel.fromJson(json)).toList();
    } catch (e) {
      print('Error in getClasses: $e');
      rethrow;
    }
  }
}
