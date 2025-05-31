import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/experience_card.dart';
import 'package:readmore/readmore.dart';

import '../../../../../config/routing/routes.dart' show Routes;

class TrainerDetailsPage extends StatefulWidget {
  final int trainerId;

  const TrainerDetailsPage(
      {super.key, required this.trainerId, required RouteSettings settings});

  @override
  State<TrainerDetailsPage> createState() => _TrainerDetailsPageState();
}

class _TrainerDetailsPageState extends State<TrainerDetailsPage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF4F3F2),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: CustomBackButtonCircle(),
          title: Text(
            'Trainer Details',
            style: AppStyles.medium20black,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 24.w),
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(top: 25.h, bottom: 5.h, left: 13.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primaryColor,
                          Colors.black,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Mohamed Elbarawy",
                              style: AppStyles.medium20black
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/images/facebook_icon.svg",
                                      width: 30,
                                      height: 35,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/images/whatsapp_icon.svg",
                                      height: 35,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      "assets/images/insta_icon.svg",
                                      height: 35,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.r))),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.trainerRatingPage);
                                    },
                                    child: Text(
                                      "Rate",
                                      style: AppStyles.medium12primary,
                                    )),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "4.8 (580 review)",
                                  style: AppStyles.regular15grey
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        // Spacer(),
                        Image.asset(
                          "assets/images/trainer2.png",
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  DefaultTabController(
                    length: 2,
                    child: TabBar(
                        controller: tabController,
                        dividerColor: Colors.transparent,
                        labelStyle: AppStyles.regular18white,
                        unselectedLabelStyle: AppStyles.regular18black,
                        indicator: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(7.r),
                        ),
                        tabs: [
                          Tab(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("About")],
                            ),
                          ),
                          Tab(
                            icon: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("Techniques")],
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 500.h,
                    child: TabBarView(
                      controller: tabController,
                      children: [aboutTab(), techniquesTab()],
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

Widget aboutTab() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 33.h,
        ),
        Text("About", style: AppStyles.medium18primary),
        SizedBox(height: 4.h),
        ReadMoreText(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          trimMode: TrimMode.Line,
          trimLines: 3,
          colorClickableText: AppColors.primaryColor,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: AppStyles.regular16primary,
          lessStyle: AppStyles.regular16primary,
          style: AppStyles.regular16black,
        ),
        SizedBox(height: 15.h),
        Text("Info", style: AppStyles.medium18primary),
        SizedBox(height: 15.h),
        RichText(
            text: TextSpan(children: [
          TextSpan(text: "Clients: ", style: AppStyles.medium16black),
          TextSpan(text: "2,580", style: AppStyles.medium16primary),
        ])),
        SizedBox(height: 16.h),
        Text("Experience", style: AppStyles.medium18primary),
        ExperienceCard(),
        ExperienceCard(),
        ExperienceCard(),
      ],
    ),
  );
}

Widget techniquesTab() {
  return ListView.separated(
    padding: EdgeInsets.only(top: 22.h),
    separatorBuilder: (context, index) => SizedBox(
      height: 22.h,
    ),
    itemCount: 5,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () => Navigator.pushNamed(context, Routes.techniqueDetails),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Color(0xffE0E0E0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/images/technique1.png",
                    width: 366.w,
                  ),
                  Center(
                      child: ImageIcon(
                    size: 50,
                    AssetImage("assets/images/play_icon.png"),
                    color: AppColors.primaryColor,
                  ))
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Chest exercise",
                style: AppStyles.medium18black,
              ),
              SizedBox(
                height: 11.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    "  4.5 (580 review)",
                    style: AppStyles.regular12grey,
                  ),
                  Spacer(),
                  Text(
                    "10 Videos",
                    style: AppStyles.regular16grey,
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
