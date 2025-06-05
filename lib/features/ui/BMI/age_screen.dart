import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../core/components/resuble_components.dart';
import '../../../core/utils/cache_helper.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int selectedIndex = 10;
  int? selectedAge;

  final List<int> ages = List.generate(91, (index) => 10 + index); // 10 - 100

  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: selectedIndex);
    selectedAge = ages[selectedIndex];
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Align(
              alignment: Alignment.topLeft,
              child: CustomBackButtonCircle(),
            ),
            SizedBox(height: 16.h),
            Image.asset(AppImages.logoLight, height: 40.h),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                "How old are you?",
                style: AppStyles.regular20black,
              ),
            ),
            SizedBox(height: 16.h),
            Icon(Icons.cake, size: 56.sp, color: AppColors.primaryColor),
            SizedBox(height: 50.h),
            SizedBox(
              height: 500.h,
              child: ListWheelScrollView.useDelegate(
                controller: scrollController,
                itemExtent: 70.h,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.0001,
                diameterRatio: 10.0,
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                    selectedAge = ages[selectedIndex];
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: ages.length,
                  builder: (context, index) {
                    final value = ages[index];
                    final isSelected = index == selectedIndex;

                    return Center(
                      child: AnimatedScale(
                        scale: isSelected ? 1.5 : 1.2,
                        duration: const Duration(milliseconds: 150),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isSelected)
                              const Icon(Icons.play_arrow,
                                  color: Colors.blue, size: 28),
                            SizedBox(width: 12.w),
                            Text(
                              "$value",
                              style: TextStyle(
                                fontSize: isSelected ? 36.sp : 20.sp,
                                color:
                                    isSelected ? Colors.blue : Colors.black54,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            const CustomLinearProgress(value: 4 / 4),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              text: "Finish",
              onPressed: () {
                if (selectedAge != null) {
                  print("Selected Age: $selectedAge");
                  print(args["gender"]);
                  print(args["weight"]);
                  print(args["height"]);
                  Navigator.pushNamed(context, Routes.dashboardScreen,
                      arguments: {
                        "gender": args["gender"],
                        "weight": args["weight"],
                        "height": args["height"],
                        "age": selectedAge
                      });
                  CacheHelper.saveData(key: "age", value: selectedAge);
                  CacheHelper.saveData(key: "isHome", value: 1);
                }
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
