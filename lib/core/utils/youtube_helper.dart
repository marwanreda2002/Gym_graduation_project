class YouTubeHelper {
  static String convertToEmbedUrl(String youtubeUrl) {
    // Handle different YouTube URL formats
    if (youtubeUrl.contains('youtube.com/embed/')) {
      return youtubeUrl;
    }

    if (youtubeUrl.contains('youtube.com/watch?v=')) {
      final videoId = youtubeUrl.split('v=')[1].split('&')[0];
      return 'https://www.youtube.com/embed/$videoId';
    }

    if (youtubeUrl.contains('youtu.be/')) {
      final videoId = youtubeUrl.split('youtu.be/')[1].split('?')[0];
      return 'https://www.youtube.com/embed/$videoId';
    }

    // If it's already an embed URL, return as is
    return youtubeUrl;
  }

  static String getYouTubeAppUrl(String youtubeUrl) {
    // Convert to YouTube app URL
    if (youtubeUrl.contains('youtube.com/embed/')) {
      final videoId = youtubeUrl.split('embed/')[1];
      return 'https://www.youtube.com/watch?v=$videoId';
    }

    if (youtubeUrl.contains('youtube.com/watch?v=')) {
      return youtubeUrl;
    }

    if (youtubeUrl.contains('youtu.be/')) {
      final videoId = youtubeUrl.split('youtu.be/')[1].split('?')[0];
      return 'https://www.youtube.com/watch?v=$videoId';
    }

    return youtubeUrl;
  }
}
