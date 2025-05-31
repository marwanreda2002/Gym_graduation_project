import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/Payment/cubit/payment_states.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitialPaymentState());

  static PaymentCubit get(context) => BlocProvider.of(context);
  String token = "";

// void getAuthToken() async {
//   emit(LoadingAuthTokenPaymentState());
//   Response response =
//       await DioHelper.postData(endPoint: EndPoints.authTokenEndPoint, data: {
//     "api_key": PaymentConstant.paymentApiKey,
//   });
//   PaymentConstant.authToken = response.data['token'];
//   token=response.data['token'];
//   print("elMor token:${PaymentConstant.authToken}");
//   response.statusCode! >= 200
//       ? emit(SuccessAuthTokenPaymentState())
//       : emit(ErrorAuthTokenPaymentState());
// }
//
// void getOrderId() async {
//   emit(LoadingOrderIdPaymentState());
//   try {
//     Response response =
//         await DioHelper.postData(endPoint: EndPoints.orderIdEndPoint, data: {
//       "auth_token": token,
//       "delivery_needed": "false",
//       "amount_cents": "10000",
//       "currency": "EGP",
//       "items": []
//     },
//         token: token);
//     PaymentConstant.orderID = response.data['id'];
//     print("elMor orderID:${PaymentConstant.orderID}");
//     if (response.statusCode! >= 200) {
//       print("success");
//       emit(SuccessOrderIdPaymentState());
//     } else {
//       print(response.data.toString());
//       emit(ErrorOrderIdPaymentState());
//     }
//   } on DioException catch (e) {
//     print('❌ DioException: ${e.response?.statusCode}');
//     print('❌ DioException Data: ${e.response?.data}');
//     print('❌ DioException Message: ${e.message}');
//     rethrow; // Optional: allow higher-level handler to catch it too
//   } catch (e) {
//     print('❌ Unknown Error: $e');
//     rethrow;
//   }
// }
//
// void getRequestToken()async{
//   emit(LoadingRequestTokenPaymentState());
//   Response response = await DioHelper.postData(endPoint: EndPoints.requestTokenEndPoint,
//       token: token,
//       data: {
//     "auth_token": token,
//     "amount_cents": "10000",
//     "expiration": 3600,
//     "currency": "EGP",
//     "order_id": PaymentConstant.orderID,
//     "integration_id": PaymentConstant.cardIdIntegration,
//     "billing_data": {
//       "apartment": "NA",
//       "email": "marwan@maro.com",
//       "floor": "NA",
//       "first_name": "Marwan",
//       "street": "NA",
//       "building": "NA",
//       "phone_number": "01211681903",
//       "shipping_method": "NA",
//       "postal_code": "NA",
//       "city": "NA",
//       "country": "NA",
//       "last_name": "Reda",
//       "state": "NA"
//     },
//     "lock_order_when_paid": "false"
//   });
//   if (response.statusCode! >= 200) {
//     print("success request token");
//     print("Marwan ${response.data['token']}");
//     PaymentConstant.requestTokenCard=response.data['token'];
//     emit(SuccessRequestTokenPaymentState());
//   } else {
//     print(response.data.toString());
//     emit(ErrorRequestTokenPaymentState());
//   }
//
// }
}
