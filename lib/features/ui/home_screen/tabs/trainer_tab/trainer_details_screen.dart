import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';
import 'package:gym_app_graduation_project/core/utils/technique_video_model.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/experience_card.dart';
import 'package:readmore/readmore.dart';

import '../../../../../config/routing/routes.dart' show Routes;

class TrainerDetailsPage extends StatefulWidget {
  final Trainer trainer;

  const TrainerDetailsPage(
      {super.key, required this.trainer, required RouteSettings settings});

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
                    padding: EdgeInsets.only(
                        top: 25.h, bottom: 5.h, left: 13.w, right: 13.w),
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
                              widget.trainer.name,
                              style: AppStyles.medium20black
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 28.h,
                            ),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      // Launch Facebook
                                      if (widget.trainer.socialMedia
                                          .containsKey('facebook')) {
                                        // You can add url_launcher here to open Facebook
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/images/facebook_icon.svg",
                                      width: 30,
                                      height: 35,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      // Launch WhatsApp
                                      if (widget.trainer.socialMedia
                                          .containsKey('whatsapp')) {
                                        // You can add url_launcher here to open WhatsApp
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/images/whatsapp_icon.svg",
                                      height: 35,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      // Launch Instagram
                                      if (widget.trainer.socialMedia
                                          .containsKey('instagram')) {
                                        // You can add url_launcher here to open Instagram
                                      }
                                    },
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
                                          context, Routes.trainerRatingPage,
                                          arguments: widget.trainer);
                                    },
                                    child: Text(
                                      "Rate",
                                      style: AppStyles.medium12primary,
                                    )),
                                SizedBox(
                                  width: 6.w,
                                ),
                                Text(
                                  "${widget.trainer.rating} (${widget.trainer.reviews} review)",
                                  style: AppStyles.regular15grey
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            widget.trainer.imagePath,
                            width: 120.w,
                            height: 150.h,
                            fit: BoxFit.cover,
                          ),
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
            widget.trainer.bio,
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
          Text("Specialization", style: AppStyles.medium18primary),
          SizedBox(height: 8.h),
          Text(
            widget.trainer.specialization,
            style: AppStyles.regular16black,
          ),
          SizedBox(height: 15.h),
          Text("Experience", style: AppStyles.medium18primary),
          SizedBox(height: 8.h),
          Text(
            "${widget.trainer.experienceYears} years",
            style: AppStyles.regular16black,
          ),
          SizedBox(height: 15.h),
          Text("Info", style: AppStyles.medium18primary),
          SizedBox(height: 15.h),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "Clients: ", style: AppStyles.medium16black),
            TextSpan(
                text: "${widget.trainer.clientsCount}",
                style: AppStyles.medium16primary),
          ])),
          SizedBox(height: 16.h),
          Text("Certifications", style: AppStyles.medium18primary),
          SizedBox(height: 8.h),
          ...widget.trainer.certifications
              .map((cert) => Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle,
                            size: 16, color: AppColors.primaryColor),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            cert,
                            style: AppStyles.regular14Black,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
          SizedBox(height: 16.h),
          Text("Work Experience", style: AppStyles.medium18primary),
          SizedBox(height: 8.h),
          ...widget.trainer.workExperience
              .map((exp) => ExperienceCard(workExperience: exp))
              .toList(),
        ],
      ),
    );
  }

  Widget techniquesTab() {
    // Get techniques based on trainer specialization
    List<TechniqueVideo> techniques = _getTechniquesForTrainer();

    return ListView.separated(
      padding: EdgeInsets.only(top: 22.h),
      separatorBuilder: (context, index) => SizedBox(
        height: 22.h,
      ),
      itemCount: techniques.length,
      itemBuilder: (context, index) {
        final technique = techniques[index];
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        technique.thumbnailUrl,
                        width: 366.w,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Center(
                        child: ImageIcon(
                      size: 50,
                      AssetImage("assets/images/play_icon.png"),
                      color: AppColors.primaryColor,
                    )),
                    Positioned(
                      bottom: 8.h,
                      right: 8.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          technique.duration,
                          style: AppStyles.regular12White,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  technique.title,
                  style: AppStyles.medium18black,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  technique.description,
                  style: AppStyles.regular14grey,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 11.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    Text(
                      "  ${widget.trainer.rating} (${widget.trainer.reviews} reviews)",
                      style: AppStyles.regular12grey,
                    ),
                    Spacer(),
                    Text(
                      "${techniques.length} Videos",
                      style: AppStyles.regular12grey,
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

  List<TechniqueVideo> _getTechniquesForTrainer() {
    switch (widget.trainer.specialization.toLowerCase()) {
      case 'strength training & hiit':
        return TechniqueVideoData.getChestVideos().take(3).toList();
      case 'yoga & meditation':
        return [
          TechniqueVideo(
            id: "yoga1",
            title: "Sun Salutation Flow",
            description:
                "Complete sun salutation sequence for energy and flexibility.",
            thumbnailUrl: "assets/images/yoga.png",
            videoUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4",
            duration: "12:30",
            category: "Yoga",
          ),
          TechniqueVideo(
            id: "yoga2",
            title: "Meditation for Beginners",
            description:
                "Guided meditation session for stress relief and mindfulness.",
            thumbnailUrl: "assets/images/technique1.png",
            videoUrl: "https://www.youtube.com/watch?v=eozdVDA78K0",
            duration: "15:45",
            category: "Meditation",
          ),
          TechniqueVideo(
            id: "yoga3",
            title: "Yin Yoga for Flexibility",
            description:
                "Deep stretching and flexibility improvement through yin yoga.",
            thumbnailUrl: "assets/images/technique2.png",
            videoUrl: "https://www.youtube.com/watch?v=8iNEnVJD_0M",
            duration: "20:15",
            category: "Yoga",
          ),
        ];
      case 'sports performance & functional fitness':
        return [
          TechniqueVideo(
            id: "sports1",
            title: "Agility Training",
            description:
                "Improve speed, coordination, and athletic performance.",
            thumbnailUrl: "assets/images/crossfit.png",
            videoUrl: "https://www.youtube.com/watch?v=YaXPRqUwItQ",
            duration: "18:20",
            category: "Sports",
          ),
          TechniqueVideo(
            id: "sports2",
            title: "Functional Movement Patterns",
            description:
                "Master essential movement patterns for daily activities.",
            thumbnailUrl: "assets/images/strength.png",
            videoUrl: "https://www.youtube.com/watch?v=3XDriUn0udo",
            duration: "22:30",
            category: "Functional",
          ),
          TechniqueVideo(
            id: "sports3",
            title: "Plyometric Training",
            description: "Explosive power training for athletic performance.",
            thumbnailUrl: "assets/images/hiit.png",
            videoUrl: "https://www.youtube.com/watch?v=0G2_XV7slIg",
            duration: "16:45",
            category: "Sports",
          ),
        ];
      case 'pilates & core strength':
        return [
          TechniqueVideo(
            id: "pilates1",
            title: "Core Foundation",
            description:
                "Build a strong foundation with basic Pilates principles.",
            thumbnailUrl: "assets/images/pilats.png",
            videoUrl: "https://www.youtube.com/watch?v=eozdVDA78K0",
            duration: "25:10",
            category: "Pilates",
          ),
          TechniqueVideo(
            id: "pilates2",
            title: "Advanced Core Work",
            description: "Challenge your core with advanced Pilates exercises.",
            thumbnailUrl: "assets/images/technique1.png",
            videoUrl: "https://www.youtube.com/watch?v=8iNEnVJD_0M",
            duration: "30:25",
            category: "Pilates",
          ),
          TechniqueVideo(
            id: "pilates3",
            title: "Posture Correction",
            description: "Improve posture and alignment through Pilates.",
            thumbnailUrl: "assets/images/technique2.png",
            videoUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4",
            duration: "28:15",
            category: "Pilates",
          ),
        ];
      case 'boxing & martial arts':
        return [
          TechniqueVideo(
            id: "boxing1",
            title: "Basic Boxing Stance",
            description:
                "Learn proper boxing stance and footwork fundamentals.",
            thumbnailUrl: "assets/images/box.png",
            videoUrl: "https://www.youtube.com/watch?v=YaXPRqUwItQ",
            duration: "14:30",
            category: "Boxing",
          ),
          TechniqueVideo(
            id: "boxing2",
            title: "Jab and Cross Combinations",
            description: "Master basic punching combinations and technique.",
            thumbnailUrl: "assets/images/technique1.png",
            videoUrl: "https://www.youtube.com/watch?v=3XDriUn0udo",
            duration: "18:45",
            category: "Boxing",
          ),
          TechniqueVideo(
            id: "boxing3",
            title: "Defensive Techniques",
            description: "Learn blocking, slipping, and defensive movements.",
            thumbnailUrl: "assets/images/technique2.png",
            videoUrl: "https://www.youtube.com/watch?v=0G2_XV7slIg",
            duration: "20:20",
            category: "Boxing",
          ),
        ];
      case 'cycling & cardio fitness':
        return [
          TechniqueVideo(
            id: "cycling1",
            title: "Indoor Cycling Basics",
            description: "Master proper cycling form and technique.",
            thumbnailUrl: "assets/images/spin.png",
            videoUrl: "https://www.youtube.com/watch?v=eozdVDA78K0",
            duration: "35:15",
            category: "Cycling",
          ),
          TechniqueVideo(
            id: "cycling2",
            title: "HIIT Cycling Intervals",
            description: "High-intensity interval training on the bike.",
            thumbnailUrl: "assets/images/hiit.png",
            videoUrl: "https://www.youtube.com/watch?v=8iNEnVJD_0M",
            duration: "28:30",
            category: "Cycling",
          ),
          TechniqueVideo(
            id: "cycling3",
            title: "Endurance Building",
            description: "Build cycling endurance and stamina.",
            thumbnailUrl: "assets/images/technique1.png",
            videoUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4",
            duration: "45:20",
            category: "Cycling",
          ),
        ];
      default:
        return TechniqueVideoData.getChestVideos().take(3).toList();
    }
  }
}
