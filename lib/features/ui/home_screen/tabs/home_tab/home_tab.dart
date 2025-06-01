import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_card.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/home_tab/qr_code_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_card.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../../core/utils/app_styels.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  Trainer trainer = Trainer(
      name: "Marwan",
      imagePath: "assets/images/trainer1.png",
      rating: 5.0,
      reviews: 500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Text(
                  "Hi,",
                  style: AppStyles.bold36Black,
                ),
                ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) => LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xff378CE7),
                            Color(0xff000000),
                          ],
                        ).createShader(bounds),
                    child: Text(
                      "Mohamed",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 36.sp),
                    )),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QrCodeScreen(),
                        ));
                  },
                  child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (Rect bounds) => LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.primaryColor,
                              AppColors.blackColor,
                            ],
                          ).createShader(bounds),
                      child: ImageIcon(
                        AssetImage("assets/images/QR_icon.png"),
                        size: 32,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: 300.w,
                  height: 105.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: Color(0xffCACACA), width: 1.5),
                      color: Colors.white),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 45.0,
                          lineWidth: 7.0,
                          percent: 0.9,
                          center: Text(
                            "${(0.9 * 100).toInt()}%",
                            style: AppStyles.bold20Primary,
                          ),
                          progressColor: AppColors.primaryColor,
                          backgroundColor: Colors.grey[300]!,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          "Gym Capacity",
                          style: AppStyles.medium24black,
                        ),
                      ]),
                ),
                Spacer(),
                Image.asset("assets/images/boy_avatar.png")
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 11.w),
                  width: 219.w,
                  height: 78.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: Color(0xffCACACA), width: 1.5),
                      color: Colors.white),
                  child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Subscription",
                          style: AppStyles.medium18black,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        CircularPercentIndicator(
                          radius: 35.0,
                          lineWidth: 6,
                          percent: 20 / 30,
                          center: Text(
                            "20/30",
                            style: AppStyles.bold14primary,
                          ),
                          progressColor: AppColors.primaryColor,
                          backgroundColor: Colors.grey[300]!,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                      ]),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  width: 153.w,
                  height: 78.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(color: Color(0xffCACACA), width: 1.5),
                      color: Colors.white),
                  child: Row(children: [
                    Text(
                      "Body Stats",
                      style: AppStyles.medium18black,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SvgPicture.asset(AppImages.dashboardIconSvg),
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Text(
                  "Gallery",
                  style: AppStyles.semibold24Black,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    //   Todo: navigate to gallery screen
                  },
                  child: Text(
                    "view all",
                    style: AppStyles.regular18primary,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 15.h,),
            CarouselSlider(
              items: [
                Image.asset("assets/images/image1.png"),
                Image.asset("assets/images/image2.png"),
                Image.asset("assets/images/image3.png"),
              ],
              options: CarouselOptions(
                height: 200,
                // aspectRatio: 16/9,
                viewportFraction: 0.7,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                // autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 250),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              ),
            ),
            // SizedBox(height: 10.h,),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Trainers",
                      style: AppStyles.semibold24Black,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        //   Todo: navigate to Trainer screen
                      },
                      child: Text(
                        "view all",
                        style: AppStyles.regular18primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20.w,
                    ),
                    itemBuilder: (context, index) => TrainerCard(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Text(
                      "Classes",
                      style: AppStyles.semibold24Black,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        //   Todo: navigate to gallery screen
                      },
                      child: Text(
                        "view all",
                        style: AppStyles.regular18primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 310.h,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ClassCard(),
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
