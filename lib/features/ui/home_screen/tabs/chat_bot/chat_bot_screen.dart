import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 21.h),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, AppColors.primaryColor])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff378CE7),
                          Color(0xff060606),
                        ],
                      ).createShader(bounds),
                  child: Text(
                    "Hi",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 36.sp),
                  )),
              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) => LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xff378CE7),
                          Color(0xff000000),
                          Color(0xff000000),
                        ],
                      ).createShader(bounds),
                  child: Text(
                    "Mohamed",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800, fontSize: 36.sp),
                  )),
              SizedBox(
                height: 90.h,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff378CE7),
                    Color(0xff000000),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 21.w),
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color(0xff90BAE8),
                          ]),
                      borderRadius: BorderRadius.circular(7.r)),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0.h,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "How can AI help me improve my workouts?",
                          style: AppStyles.regular16black,
                        ),
                      ),
                      Divider(
                        color: Color(0x994c4c4c),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0.h,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "What kind of data does the AI need to personalize my fitness plan?",
                          style: AppStyles.regular16black,
                        ),
                      ),
                      Divider(
                        color: Color(0x994c4c4c),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0.h,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Can the AI suggest nutrition plans based on my fitness goals?",
                          style: AppStyles.regular16black,
                        ),
                      ),
                      Divider(
                        color: Color(0x994c4c4c),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 16.0.h,
                        ),
                        child: Text(
                          textAlign: TextAlign.center,
                          "How does the AI ensure my workouts are safe and effective?",
                          style: AppStyles.regular16black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 180.h,
              ),
              // Spacer(),
              Row(
                children: [
                  ImageIcon(
                    AssetImage("assets/images/upload_image_icon.png"),
                    color: Color(0xff727272),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0x7affffff),
                          hintText: "Enter your message.... ",
                          hintStyle: AppStyles.regular15grey
                              .copyWith(color: Color(0xff6F6F6F)),
                          suffixIcon: Icon(
                            Icons.send_outlined,
                            color: Color(0xff727272),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(28.5.r),
                              borderSide: BorderSide.none)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
