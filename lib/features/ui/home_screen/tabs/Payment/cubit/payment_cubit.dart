import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/core/api/api_manager.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/Payment/cubit/payment_states.dart';

import '../../../../../../core/api/constant.dart';
import '../../../../../../core/api/end_points.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialPaymentState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  void getAuthToken() async {
    emit(LoadingAuthTokenPaymentState());
    Response response =
        await DioHelper.postData(endPoint: EndPoints.authTokenEndPoint, data: {
      "api_key": ApiConstant.paymentApiKey,
    });
    String token = response.data['token'];
    print("elMor token:$token");
    response.statusCode! >= 200
        ? emit(SuccessAuthTokenPaymentState())
        : emit(ErrorAuthTokenPaymentState());
  }
}
