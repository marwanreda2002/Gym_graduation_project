class TechniqueVideo {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;
  final String duration;
  final String category;

  TechniqueVideo({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
    required this.duration,
    required this.category,
  });
}

class TechniqueVideoData {
  static List<TechniqueVideo> getChestVideos() {
    return [
      TechniqueVideo(
        id: "1",
        title: "Bench Press Tutorial",
        description:
            "Learn proper bench press form and technique for maximum chest development.",
        thumbnailUrl: "assets/images/chest_exercise_image.png",
        videoUrl: "https://www.youtube.com/watch?v=0G2_XV7slIg",
        duration: "8:45",
        category: "Chest",
      ),
      TechniqueVideo(
        id: "2",
        title: "Push-Ups Masterclass",
        description:
            "Master the perfect push-up form for chest strength and endurance.",
        thumbnailUrl: "assets/images/technique1.png",
        videoUrl: "https://www.youtube.com/watch?v=IODxDxX7oi4",
        duration: "6:30",
        category: "Chest",
      ),
      TechniqueVideo(
        id: "3",
        title: "Dumbbell Flyes",
        description:
            "Isolation exercise for chest muscles with proper form demonstration.",
        thumbnailUrl: "assets/images/technique2.png",
        videoUrl: "https://www.youtube.com/watch?v=eozdVDA78K0",
        duration: "5:15",
        category: "Chest",
      ),
      TechniqueVideo(
        id: "4",
        title: "Incline Press",
        description:
            "Upper chest development with incline bench press technique.",
        thumbnailUrl: "assets/images/chest_exercise_image.png",
        videoUrl: "https://www.youtube.com/watch?v=8iNEnVJD_0M",
        duration: "7:20",
        category: "Chest",
      ),
      TechniqueVideo(
        id: "5",
        title: "Decline Press",
        description: "Lower chest targeting with decline bench press form.",
        thumbnailUrl: "assets/images/technique1.png",
        videoUrl: "https://www.youtube.com/watch?v=0G2_XV7slIg",
        duration: "6:45",
        category: "Chest",
      ),
    ];
  }

  static List<TechniqueVideo> getBackVideos() {
    return [
      TechniqueVideo(
        id: "6",
        title: "Pull-Ups Guide",
        description: "Complete guide to mastering pull-ups for back strength.",
        thumbnailUrl: "assets/images/technique2.png",
        videoUrl: "https://www.youtube.com/watch?v=eGo4IYlbE5g",
        duration: "9:15",
        category: "Back",
      ),
      TechniqueVideo(
        id: "7",
        title: "Deadlift Form",
        description: "Proper deadlift technique for back and overall strength.",
        thumbnailUrl: "assets/images/chest_exercise_image.png",
        videoUrl: "https://www.youtube.com/watch?v=1ZXobu7JvvE",
        duration: "10:30",
        category: "Back",
      ),
    ];
  }

  static List<TechniqueVideo> getLegVideos() {
    return [
      TechniqueVideo(
        id: "8",
        title: "Squat Tutorial",
        description: "Perfect squat form for leg development and strength.",
        thumbnailUrl: "assets/images/technique1.png",
        videoUrl: "https://www.youtube.com/watch?v=YaXPRqUwItQ",
        duration: "8:20",
        category: "Legs",
      ),
      TechniqueVideo(
        id: "9",
        title: "Lunges Masterclass",
        description:
            "Master the perfect lunge form for leg strength and balance.",
        thumbnailUrl: "assets/images/technique2.png",
        videoUrl: "https://www.youtube.com/watch?v=3XDriUn0udo",
        duration: "6:45",
        category: "Legs",
      ),
    ];
  }

  static List<TechniqueVideo> getAllVideos() {
    return [
      ...getChestVideos(),
      ...getBackVideos(),
      ...getLegVideos(),
    ];
  }
}
