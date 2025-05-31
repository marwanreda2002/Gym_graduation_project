import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../../../core/utils/app_colors.dart' show AppColors;

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            ImageIcon(
              AssetImage("assets/images/thank_icon.png"),
              color: AppColors.primaryColor,
              size: 121,
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                "Thanks for Rating",
                style: AppStyles.bold24primary,
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.r)),
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Done',
                style: AppStyles.regular18white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
