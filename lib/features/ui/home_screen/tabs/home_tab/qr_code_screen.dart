import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:gym_app_graduation_project/core/cache/cache_helper.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = CashHelper.getData(key: 'id')?.toString() ?? '';
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: const Text('Your QR Code'),
        centerTitle: true,
        leading: CustomBackButtonCircle(),
      ),
      body: Center(
        child: userId.isNotEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Center(child: Text("Scan Me",style: AppStyles.bold36Primary,)),
                  // Spacer(),
                  Center(
                    child: Stack(alignment: Alignment.topRight, children: [
                      SizedBox(
                        height: 500,
                        width: 300,
                      ),
                      Positioned(
                          bottom: 150,
                          child: Image.asset("assets/images/scan_me.png")),
                      QrImageView(
                        data: userId,
                        version: QrVersions.auto,
                        size: 220.0,
                      ),
                    ]),
                  ),
                  // Spacer(),
                  // const SizedBox(height: 24),
                  // Text('User ID: $userId', style: const TextStyle(fontSize: 18)),
                ],
              )
            : const Text('No user ID found.'),
      ),
    );
  }
}
