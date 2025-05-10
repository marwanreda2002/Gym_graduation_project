import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_details_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_colors.dart' show AppColors_Detail;

class VideosPage extends StatelessWidget {
  final List<Technique> techniques;

  const VideosPage({super.key, required this.techniques});

  Future<void> _openVideo(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No cannot browther $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // جمع كل الفيديوهات في List وحدة
    final allVideos = techniques.expand((tech) => tech.videos).toList();

    return Scaffold(
      backgroundColor: AppColors_Detail.background,
      appBar: AppBar(
        title: const Text('vodeos'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: allVideos.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final video = allVideos[index];
            return GestureDetector(
              onTap: () => _openVideo(video.url),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors_Detail.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        video.thumbnail,
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        video.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors_Detail.primary,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(100, 35),
                        ),
                        onPressed: () => _openVideo(video.url),
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('turn on video'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
