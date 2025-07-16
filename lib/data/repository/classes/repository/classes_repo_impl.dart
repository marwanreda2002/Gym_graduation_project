import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gym_app_graduation_project/data/models/class_model.dart';
import 'package:gym_app_graduation_project/data/repository/classes/data_source/classes_remote_data_source.dart';
import 'package:gym_app_graduation_project/data/repository/classes/repository/classes_repo.dart';

class ClassesRepoImpl implements ClassesRepo {
  final ClassesRemoteDataSource remoteDataSource;

  ClassesRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<ClassModel>>> getClasses() async {
    try {
      final classes = await remoteDataSource.getClasses();
      return Right(classes);
    } catch (e) {
      if (e is DioException) {
        return Left(e.response?.data['message'] ?? 'An error occurred');
      }
      return Left(e.toString());
    }
  }
}
