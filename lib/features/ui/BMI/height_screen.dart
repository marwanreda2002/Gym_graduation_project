import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../core/components/resuble_components.dart';
import '../../../core/utils/cache_helper.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  bool isCm = true;
  int selectedIndex = 21;
  int? selectedHeight;

  final List<int> heightsCm =
      List.generate(100, (index) => 130 + index); // 130 - 229
  final List<int> heightsFt =
      List.generate(100, (index) => index + 3); // 3 - 102

  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: selectedIndex);
    if (isCm) selectedHeight = heightsCm[selectedIndex];
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String gender = args["gender"].toString().split('.').last;
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

            // Logo
            Image.asset(AppImages.logoLight, height: 40.h),

            SizedBox(height: 10.h),

            // Title
            Center(
              child: Text(
                "What is your current height?",
                style: AppStyles.regular20black,
              ),
            ),

            SizedBox(height: 21.h),

            // CM / FT Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCm = true;
                      selectedHeight = heightsCm[selectedIndex];
                    });
                  },
                  child: Container(
                    width: 137 / 2.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: isCm ? AppColors.primaryColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        "cm",
                        style: AppStyles.regular20black.copyWith(
                          color: isCm ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isCm = false;
                      selectedHeight = null;
                    });
                  },
                  child: Container(
                    width: 137 / 2.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: !isCm ? AppColors.primaryColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        "ft",
                        style: AppStyles.regular20black.copyWith(
                          color: !isCm ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50.h),

            // Scroll Picker
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
                    if (isCm) selectedHeight = heightsCm[selectedIndex];
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: isCm ? heightsCm.length : heightsFt.length,
                  builder: (context, index) {
                    final value = isCm ? heightsCm[index] : heightsFt[index];
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
                              isSelected
                                  ? "$value ${isCm ? 'CM' : 'FT'}"
                                  : "$value",
                              style: TextStyle(
                                fontSize: isSelected ? 36.sp : 20.sp,
                                color:
                                    isSelected ? Colors.blue : Colors.black54,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Spacer(),

            const CustomLinearProgress(value: 2 / 4),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              text: "Continue",
              onPressed: () {
                if (selectedHeight != null) {
                  CacheHelper.saveData(key: "height", value: selectedHeight);
                  Navigator.pushNamed(context, Routes.weightScreen,
                      arguments: {"gender": gender, "height": selectedHeight});
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Height only supported in CM")),
                  );
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
