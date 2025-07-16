import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routing/app_router.dart';
import '../../../../../config/routing/routes.dart';
import '../../../../../core/components/resuble_components.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styels.dart';
import '../../../../../core/utils/technique_video_model.dart';

class TechniquesDetails extends StatelessWidget {
  const TechniquesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final videos = TechniqueVideoData.getChestVideos();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
        title: Text(
          'Chest exercise',
          style: AppStyles.medium18black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Video
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.videoPlayer,
                    arguments: {
                      'videoUrl': videos.first.videoUrl,
                      'videoTitle': videos.first.title,
                      'videoDescription': videos.first.description,
                    },
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      videos.first.thumbnailUrl,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Center(
                        child: ImageIcon(
                      size: 50,
                      AssetImage("assets/images/play_icon.png"),
                      color: AppColors.primaryColor,
                    )),
                    Positioned(
                        bottom: 8.h,
                        left: 12.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          decoration: BoxDecoration(
                            color: Color(0xbd4e4e4e),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            videos.first.duration,
                            style: AppStyles.regular14white,
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      videos.first.title,
                      style: AppStyles.regular24black,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      videos.first.description,
                      style: AppStyles.regular16grey.copyWith(
                        color: Color(0xff4c4c4c),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    // Video List
                    ...videos
                        .map((video) => ExerciseWidget(video: video))
                        .toList(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExerciseWidget extends StatelessWidget {
  final TechniqueVideo video;

  const ExerciseWidget({
    super.key,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.videoPlayer,
          arguments: {
            'videoUrl': video.videoUrl,
            'videoTitle': video.title,
            'videoDescription': video.description,
          },
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    video.thumbnailUrl,
                    width: 120.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                  ),
                  ImageIcon(
                    size: 16,
                    AssetImage("assets/images/play_icon.png"),
                    color: AppColors.primaryColor,
                  ),
                  Positioned(
                      bottom: 8.h,
                      left: 12.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        decoration: BoxDecoration(
                          color: Color(0xbd4e4e4e),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          video.duration,
                          style: AppStyles.regular14white,
                        ),
                      ))
                ],
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      video.title,
                      style: AppStyles.regular16black,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      video.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: AppStyles.regular14grey.copyWith(
                        color: Color(0xff6F6F6F),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 26.h,
          )
        ],
      ),
    );
  }
}
