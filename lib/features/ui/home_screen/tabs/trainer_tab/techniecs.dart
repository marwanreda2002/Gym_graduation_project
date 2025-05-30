import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_details_model.dart';

import '../../../../../core/utils/app_colors.dart'
    show AppColors, AppColors_Detail;

class TechniqueVideosPage extends StatelessWidget {
  final List<Video> videos;
  final String title;

  const TechniqueVideosPage(
      {super.key, required this.videos, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors_Detail.background,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return Card(
            margin: const EdgeInsets.all(12),
            child: ListTile(
              leading: Image.network(video.thumbnail,
                  width: 60, height: 60, fit: BoxFit.cover),
              title: Text(video.title),
              onTap: () {
                // Open the video URL in a web browser or video player
                // You can use url_launcher package for this
                // Example: launch(video.url);
              },
            ),
          );
        },
      ),
    );
  }
}
