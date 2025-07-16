import 'package:gym_app_graduation_project/data/models/class_model.dart';

abstract class ClassesState {}

class ClassesInitial extends ClassesState {}

class ClassesLoading extends ClassesState {}

class ClassesSuccess extends ClassesState {
  final List<ClassModel> classes;

  ClassesSuccess(this.classes);
}

class ClassesError extends ClassesState {
  final String message;

  ClassesError(this.message);
}
