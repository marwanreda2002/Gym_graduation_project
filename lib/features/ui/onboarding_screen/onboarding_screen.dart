import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: currentPageIndex != OnboardingModel.pages.length - 1
                ? TextButton(
                    onPressed: () {},
                    child: Text(
                      'Skip',
                      style: AppStyles.regular24Primary,
                    ))
                : Container(),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                controller: pageController,
                onPageChanged: (index) {
                  currentPageIndex = index;
                  setState(() {});
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    Expanded(
                      child: Container(
                        constraints: BoxConstraints(maxHeight: 400.h),
                        child: Image.asset(
                            OnboardingModel.pages[index].imageLight),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    OnboardingModel.pages[index].title,
                    SizedBox(
                      height: 50.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      child: AutoSizeText(
                        OnboardingModel.pages[index].content,
                        style: AppStyles.regular16black,
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Row(
                children: [
                  Expanded(
                    child: AnimatedAlign(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      alignment:
                          currentPageIndex == OnboardingModel.pages.length - 1
                              ? Alignment.centerLeft
                              : Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          OnboardingModel.pages.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
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
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return ScaleTransition(scale: animation, child: child);
                      },
                      child:
                          currentPageIndex == OnboardingModel.pages.length - 1
                              ? CustomElevatedButton(
                                  key: ValueKey('GetStartedButton'),
                                  text: 'Get Started',
                                  textStyle: AppStyles.regular16black,
                                  onPressed: () {},
                                )
                              : SizedBox(
                                  height: 70.h,
                                  key: ValueKey('Empty'),
                                ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
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
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(text: 'Welcome ', style: AppStyles.bold36Primary),
              TextSpan(text: 'To ', style: AppStyles.bold36Black),
            ]),
          ),
          Image.asset(
            AppImages.logoLight,
            width: 70.w,
          )
        ],
      ),
      content:
          'Your ultimate fitness companion. Track, train, and transform your way to greatness',
    ),
    OnboardingModel(
      imageLight: AppImages.onboardingTwo,
      imageDark: AppImages.onboardingTwo,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: 'Check Gym ', style: AppStyles.bold36Black),
                TextSpan(
                    text: 'Capacity in Real-Time! ',
                    style: AppStyles.bold36Primary),
              ]),
            ),
          ),
        ],
      ),
      content: 'Say goodbye to crowded workouts! With our latest feature',
    ),
    OnboardingModel(
      imageLight: AppImages.onboardingThree,
      imageDark: AppImages.onboardingThree,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: 'LEARN ', style: AppStyles.bold36Black),
                TextSpan(text: 'Techniques ', style: AppStyles.bold36Primary),
              ]),
            ),
          ),
        ],
      ),
      content:
          'Step-by-Step Instructions: Learn the proper way to perform exercises for maximum effectiveness.',
    ),
  ];
}
