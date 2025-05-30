import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/Payment/cubit/payment_cubit.dart';

import 'cubit/payment_states.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // PaymentCubit.get(context).getAuthToken();
    return BlocProvider(
      create: (context) => PaymentCubit()..getAuthToken(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is SuccessAuthTokenPaymentState) {
            print("success");
          }
          if (state is ErrorAuthTokenPaymentState) {
            print("error");
          }
          if (state is LoadingAuthTokenPaymentState) {
            print("loading");
          }
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("test"),
          ),
        ),
      ),
    );
  }
}
