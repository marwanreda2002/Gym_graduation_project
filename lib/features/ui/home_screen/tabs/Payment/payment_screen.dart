import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/Payment/cubit/payment_cubit.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

import 'cubit/payment_states.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // PaymentCubit.get(context).getAuthToken();
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is SuccessAuthTokenPaymentState) {
            // PaymentCubit.get(context).getOrderId();
            print("success");
          }
          if (state is ErrorAuthTokenPaymentState) {
            print("error");
          }
          if (state is LoadingAuthTokenPaymentState) {
            print("loading");
          }
          if (state is SuccessOrderIdPaymentState) {
            // PaymentCubit.get(context).getRequestToken();
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("test"),
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentView(
                        onPaymentSuccess: () {
                          print("success payment");
                        },
                        onPaymentError: () {
                          print("failed payment");
                        },
                        price:
                            100, // Required: Total price (e.g., 100 for 100 EGP)
                      ),
                    ),
                  );
                },
                child: Text("visa")),
          ),
        ),
      ),
    );
  }
}
