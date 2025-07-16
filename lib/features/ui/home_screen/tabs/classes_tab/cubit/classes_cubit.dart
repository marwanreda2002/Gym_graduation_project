import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/core/utils/mock_data.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/cubit/classes_states.dart';

class ClassesCubit extends Cubit<ClassesState> {
  ClassesCubit() : super(ClassesInitial());

  void getClasses() async {
    emit(ClassesLoading());

    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    try {
      final classes = MockData.getMockClasses();
      emit(ClassesSuccess(classes));
    } catch (e) {
      emit(ClassesError(e.toString()));
    }
  }
}
