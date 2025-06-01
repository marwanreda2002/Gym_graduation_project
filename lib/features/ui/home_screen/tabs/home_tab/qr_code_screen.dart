import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
      ),
      body: Center(
        child: Image.asset("assets/images/qr_icon_scan.png"),
      ),
    );
  }
}
