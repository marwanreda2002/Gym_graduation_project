import 'package:gym_app_graduation_project/data/models/class_model.dart';

abstract class ClassesRemoteDataSource {
  Future<List<ClassModel>> getClasses();
}
