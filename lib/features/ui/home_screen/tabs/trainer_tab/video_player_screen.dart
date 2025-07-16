import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/youtube_helper.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoDescription;

  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDescription,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late WebViewController _webViewController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final embedUrl = YouTubeHelper.convertToEmbedUrl(widget.videoUrl);
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(embedUrl));
  }

  Future<void> _launchYouTube() async {
    final youtubeUrl = YouTubeHelper.getYouTubeAppUrl(widget.videoUrl);
    final Uri url = Uri.parse(youtubeUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not launch YouTube')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButtonCircle(),
        title: Text(
          'Video Player',
          style: AppStyles.medium18black,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _launchYouTube,
            icon: const Icon(Icons.open_in_new),
            tooltip: 'Open in YouTube',
          ),
        ],
      ),
      body: Column(
        children: [
          // Video Player
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              children: [
                WebViewWidget(controller: _webViewController),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
          // Video Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.videoTitle,
                    style: AppStyles.regular24black,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    widget.videoDescription,
                    style: AppStyles.regular16grey,
                  ),
                  SizedBox(height: 16.h),
                  const Divider(),
                  SizedBox(height: 16.h),
                  Text(
                    'Instructions:',
                    style: AppStyles.medium18black,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    '• Tap the play button to start the video\n'
                    '• Use the external button to open in YouTube app\n'
                    '• Follow the technique demonstration carefully\n'
                    '• Practice with proper form and technique',
                    style: AppStyles.regular16grey,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
