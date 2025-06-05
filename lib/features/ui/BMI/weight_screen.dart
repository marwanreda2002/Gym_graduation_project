import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../core/components/resuble_components.dart';
import '../../../core/utils/cache_helper.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  bool isKg = true;
  int selectedIndex = 30;
  int? selectedWeight;

  final List<int> weightsKg =
      List.generate(120, (index) => 30 + index); // 30 - 149 kg
  final List<int> weightsLb =
      List.generate(180, (index) => 66 + index); // 66 - 245 lb

  late FixedExtentScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: selectedIndex);
    if (isKg) selectedWeight = weightsKg[selectedIndex];
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
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "What is your current weight?",
                style: AppStyles.regular20black,
              ),
            ),
            SizedBox(height: 21.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = true;
                      selectedWeight = weightsKg[selectedIndex];
                    });
                  },
                  child: Container(
                    width: 137 / 2.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: isKg ? AppColors.primaryColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        "kg",
                        style: AppStyles.regular20black.copyWith(
                          color: isKg ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isKg = false;
                      selectedWeight = null;
                    });
                  },
                  child: Container(
                    width: 137 / 2.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: !isKg ? AppColors.primaryColor : Colors.grey[200],
                    ),
                    child: Center(
                      child: Text(
                        "lb",
                        style: AppStyles.regular20black.copyWith(
                          color: !isKg ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                    if (isKg) selectedWeight = weightsKg[selectedIndex];
                  });
                },
                childDelegate: ListWheelChildBuilderDelegate(
                  childCount: isKg ? weightsKg.length : weightsLb.length,
                  builder: (context, index) {
                    final value = isKg ? weightsKg[index] : weightsLb[index];
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
                                  ? "$value ${isKg ? 'KG' : 'LB'}"
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
            const Spacer(),
            const CustomLinearProgress(value: 3 / 4),
            SizedBox(height: 16.h),
            CustomElevatedButton(
              text: "Continue",
              onPressed: () {
                if (selectedWeight != null) {
                  CacheHelper.saveData(key: "weight", value: selectedWeight);
                  Navigator.pushNamed(context, Routes.ageScreen, arguments: {
                    "gender": args["gender"],
                    "height": args["height"],
                    "weight": selectedWeight
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Weight only supported in KG")),
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
