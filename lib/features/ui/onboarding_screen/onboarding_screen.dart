import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

import '../../../config/routing/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3F4F6),
        leading: currentPageIndex != 0
            ? IconButton(
                onPressed: () {
                  pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
              )
            : null,
        actions: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: currentPageIndex != OnboardingModel.pages.length - 1
                ? TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, Routes.loginScreen);
                    },
                    child: Text(
                      'Skip',
                      style: AppStyles.regular16primary,
                    ))
                : Container(width: 70),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: OnboardingModel.pages.length,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child:
                          Image.asset(OnboardingModel.pages[index].imageLight),
                    ),
                    const Spacer(),
                    OnboardingModel.pages[index].title,
                    SizedBox(
                      height: 20.h,
                    ),
                    AutoSizeText(
                      OnboardingModel.pages[index].content,
                      style: AppStyles.regular16grey,
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                OnboardingModel.pages.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: 8,
                    width: currentPageIndex == index ? 40 : 8,
                    decoration: BoxDecoration(
                      color: currentPageIndex == index
                          ? AppColors.primaryColor
                          : AppColors.darkGreyColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: currentPageIndex == OnboardingModel.pages.length - 1
                  ? CustomElevatedButton(
                      key: const ValueKey('GetStartedButton'),
                      text: 'Get started',
                      textStyle: AppStyles.regular18white,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginScreen);
                      },
                    )
                  : CustomElevatedButton(
                      key: const ValueKey('NextButton'),
                      text: 'Next',
                      textStyle: AppStyles.regular18white,
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingModel {
  String imageLight;
  String imageDark;
  Widget title;
  String content;

  OnboardingModel(
      {required this.imageLight,
      required this.imageDark,
      required this.title,
      required this.content});
  static List<OnboardingModel> pages = [
    OnboardingModel(
      imageLight: AppImages.onboardingOne,
      imageDark: AppImages.onboardingOne,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Welcome To ',
                  style: AppStyles.bold24primary.copyWith(color: Colors.black)),
            ]),
          ),
          SizedBox(width: 10.w),
          Image.asset(
            AppImages.logoLight,
            height: 30.h,
          ),
        ],
      ),
      content:
          'Your ultimate fitness companion. Track, train, and transform your way to greatness',
    ),
    OnboardingModel(
      imageLight: AppImages.onboardingTwo,
      imageDark: AppImages.onboardingTwo,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Check Gym\n',
              style: AppStyles.bold24primary.copyWith(color: Colors.black)),
          TextSpan(
              text: 'Capacity in Real-Time!', style: AppStyles.bold24primary),
        ]),
      ),
      content: 'Say goodbye to crowded workouts!\nWith our latest feature',
    ),
    OnboardingModel(
      imageLight: AppImages.onboardingThree,
      imageDark: AppImages.onboardingThree,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'LEARN\n',
              style: AppStyles.bold24primary.copyWith(color: Colors.black)),
          TextSpan(text: 'Techniques', style: AppStyles.bold24primary),
        ]),
      ),
      content:
          'Step-by-Step Instructions: Learn the proper way to perform exercises for maximum effectiveness.',
    ),
  ];
}
