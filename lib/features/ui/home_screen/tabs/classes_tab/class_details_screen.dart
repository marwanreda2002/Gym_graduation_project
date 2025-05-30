import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

class ClassDetailsScreen extends StatelessWidget {
  const ClassDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: 21.h, left: 28.w, right: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: Image.asset(
                "assets/images/zomba_image.png",
                width: 374.w,
                height: 236.h,
              ),
            ),
            SizedBox(
              height: 34.h,
            ),
            Text("Zomba class", style: AppStyles.regular32black),
            SizedBox(
              height: 38.h,
            ),
            classDataWidget(
              name: "Trainer:",
              data: "Kareem Abdelaziz",
            ),
            classDataWidget(
              name: "Time:   ",
              data: "05:00 to 06:00 PM",
            ),
            classDataWidget(
              name: "Date:   ",
              data: "07 DEC 2024",
            ),
            classDataWidget(
              name: "Spots:  ",
              data: "15 left",
            ),
            classDataWidget(
              name: "Price:  ",
              data: "300 EGP",
            ),
            Spacer(),
            classTrainersButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.paymentScreen);
              },
              name: "Book Now",
            ),
          ],
        ),
      ),
    );
  }
}

class classDataWidget extends StatelessWidget {
  classDataWidget({
    super.key,
    required this.name,
    required this.data,
  });

  String name;
  String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              name,
              style:
                  AppStyles.regular16black.copyWith(color: Color(0xff6F6F6F)),
            ),
            SizedBox(
              width: 53.w,
            ),
            Text(
              data,
              style: AppStyles.regular16primary,
            )
          ],
        ),
        SizedBox(
          height: 42.h,
        )
      ],
    );
  }
}
