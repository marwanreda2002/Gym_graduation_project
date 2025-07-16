import 'package:dartz/dartz.dart';
import 'package:gym_app_graduation_project/data/models/class_model.dart';

abstract class ClassesRepo {
  Future<Either<String, List<ClassModel>>> getClasses();
}
