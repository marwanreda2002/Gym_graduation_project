class RegisterStates{}
class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState({required this.error});
}
class RegisterSuccessState extends RegisterStates{}
class RegisterLoadingState extends RegisterStates{}
class RegisterInitialState extends RegisterStates{}