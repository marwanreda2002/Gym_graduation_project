import 'package:gym_app_graduation_project/data/models/class_model.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';

class MockData {
  static List<ClassModel> getMockClasses() {
    return [
      ClassModel(
        id: "1",
        name: "Zumba Fitness",
        description:
            "High-energy dance fitness class that combines Latin and international music with dance moves.",
        trainerName: "Sarah Johnson",
        imageUrl: "assets/images/zumba_fitness.png",
        price: 650,
        timing: "6:00 PM - 7:00 PM",
        capacity: 25,
      ),
      ClassModel(
        id: "2",
        name: "Yoga Flow",
        description:
            "Gentle yoga class focusing on flexibility, balance, and mindfulness.",
        trainerName: "Michael Chen",
        imageUrl: "assets/images/yoga.png",
        price: 350,
        timing: "7:30 AM - 8:30 AM",
        capacity: 20,
      ),
      ClassModel(
        id: "3",
        name: "CrossFit Training",
        description:
            "High-intensity functional movements that will challenge your strength and endurance.",
        trainerName: "Alex Rodriguez",
        imageUrl: "assets/images/crossfit.png",
        price: 480,
        timing: "5:00 PM - 6:30 PM",
        capacity: 15,
      ),
      ClassModel(
        id: "4",
        name: "Pilates Core",
        description:
            "Focus on core strength, flexibility, and overall body awareness.",
        trainerName: "Emma Wilson",
        imageUrl: "assets/images/pilats.png",
        price: 1100,
        timing: "9:00 AM - 10:00 AM",
        capacity: 18,
      ),
      ClassModel(
        id: "5",
        name: "Boxing Basics",
        description:
            "Learn boxing fundamentals while getting an intense cardio workout.",
        trainerName: "David Thompson",
        imageUrl: "assets/images/box.png",
        price: 680,
        timing: "8:00 PM - 9:00 PM",
        capacity: 12,
      ),
      ClassModel(
        id: "6",
        name: "Spinning Class",
        description:
            "Indoor cycling class with energetic music and challenging intervals.",
        trainerName: "Lisa Park",
        imageUrl: "assets/images/spin.png",
        price: 783,
        timing: "6:30 AM - 7:30 AM",
        capacity: 30,
      ),
      ClassModel(
        id: "7",
        name: "HIIT Training",
        description:
            "High-Intensity Interval Training for maximum calorie burn and fitness gains.",
        trainerName: "James Miller",
        imageUrl: "assets/images/hiit.png",
        price: 980,
        timing: "7:00 PM - 8:00 PM",
        capacity: 22,
      ),
      ClassModel(
        id: "8",
        name: "Strength Training",
        description:
            "Build muscle and increase strength with proper form and technique.",
        trainerName: "Rachel Green",
        imageUrl: "assets/images/strength.png",
        price: 1550,
        timing: "5:30 PM - 6:30 PM",
        capacity: 16,
      ),
    ];
  }

  static List<Trainer> getMockTrainers() {
    return [
      Trainer(
        name: "Sarah Johnson",
        imagePath: "assets/images/f.png",
        rating: 4.8,
        reviews: 156,
        bio:
            "Sarah is a certified personal trainer with over 8 years of experience in fitness and wellness. She specializes in strength training, HIIT workouts, and helping clients achieve their weight loss goals. Sarah believes in creating sustainable, long-term fitness habits that fit into your lifestyle.",
        specialization: "Strength Training & HIIT",
        experienceYears: 8,
        clientsCount: 2580,
        certifications: [
          "NASM Certified Personal Trainer",
          "ACE Fitness Nutrition Specialist",
          "CPR/AED Certified",
          "CrossFit Level 1 Trainer"
        ],
        workExperience: [
          WorkExperience(
            company: "Gold's Gym",
            position: "Senior Personal Trainer",
            duration: "2019 - 2023",
            achievements: [
              "Trained over 500 clients with 95% success rate",
              "Led group fitness classes with 50+ participants",
              "Developed specialized programs for weight loss",
              "Mentored 15 junior trainers"
            ],
          ),
          WorkExperience(
            company: "Fitness First",
            position: "Personal Trainer",
            duration: "2016 - 2019",
            achievements: [
              "Helped 200+ clients achieve their fitness goals",
              "Specialized in post-injury rehabilitation",
              "Created nutrition and workout plans",
              "Conducted fitness assessments and evaluations"
            ],
          ),
        ],
        socialMedia: {
          "instagram": "@sarahjohnson_fitness",
          "facebook": "Sarah Johnson Fitness",
          "whatsapp": "+1234567890"
        },
      ),
      Trainer(
        name: "Michael Chen",
        imagePath: "assets/images/1.png",
        rating: 4.9,
        reviews: 203,
        bio:
            "Michael is a yoga and meditation expert with a deep understanding of mind-body connection. He combines traditional yoga practices with modern fitness techniques to create holistic wellness programs. His approach focuses on flexibility, balance, and mental well-being.",
        specialization: "Yoga & Meditation",
        experienceYears: 12,
        clientsCount: 3200,
        certifications: [
          "RYT-500 Yoga Alliance Certified",
          "Meditation Teacher Certification",
          "Pilates Mat Instructor",
          "Thai Yoga Massage Therapist"
        ],
        workExperience: [
          WorkExperience(
            company: "Zen Fitness Studio",
            position: "Lead Yoga Instructor",
            duration: "2020 - Present",
            achievements: [
              "Taught over 1000 yoga classes",
              "Developed specialized programs for stress relief",
              "Trained corporate clients in mindfulness",
              "Led yoga retreats and workshops"
            ],
          ),
          WorkExperience(
            company: "Mindful Movement Center",
            position: "Yoga & Wellness Coach",
            duration: "2015 - 2020",
            achievements: [
              "Created meditation programs for beginners",
              "Specialized in therapeutic yoga for injuries",
              "Conducted wellness workshops",
              "Published articles on mindfulness"
            ],
          ),
        ],
        socialMedia: {
          "instagram": "@michaelchen_yoga",
          "facebook": "Michael Chen Yoga",
          "whatsapp": "+1234567891"
        },
      ),
      Trainer(
        name: "Alex Rodriguez",
        imagePath: "assets/images/2.png",
        rating: 4.7,
        reviews: 89,
        bio:
            "Alex is a former professional athlete turned fitness coach. He specializes in sports performance training, functional fitness, and helping athletes reach their peak potential. His training methods are based on scientific principles and real-world athletic experience.",
        specialization: "Sports Performance & Functional Fitness",
        experienceYears: 6,
        clientsCount: 1200,
        certifications: [
          "CSCS - Certified Strength & Conditioning Specialist",
          "USA Weightlifting Level 2 Coach",
          "Functional Movement Screen Certified",
          "Sports Nutrition Specialist"
        ],
        workExperience: [
          WorkExperience(
            company: "Elite Performance Center",
            position: "Head Performance Coach",
            duration: "2021 - Present",
            achievements: [
              "Trained 50+ professional athletes",
              "Improved team performance by 25%",
              "Developed injury prevention programs",
              "Created sports-specific training protocols"
            ],
          ),
          WorkExperience(
            company: "University Athletics",
            position: "Assistant Strength Coach",
            duration: "2018 - 2021",
            achievements: [
              "Coached college athletes in multiple sports",
              "Implemented strength training programs",
              "Conducted performance testing",
              "Assisted in injury rehabilitation"
            ],
          ),
        ],
        socialMedia: {
          "instagram": "@alexrodriguez_performance",
          "facebook": "Alex Rodriguez Performance",
          "whatsapp": "+1234567892"
        },
      ),
      Trainer(
        name: "Emma Wilson",
        imagePath: "assets/images/f.png",
        rating: 4.6,
        reviews: 134,
        bio:
            "Emma is a Pilates and core strength specialist who focuses on improving posture, flexibility, and overall body awareness. She has helped hundreds of clients recover from injuries and develop strong, functional bodies through mindful movement.",
        specialization: "Pilates & Core Strength",
        experienceYears: 7,
        clientsCount: 1800,
        certifications: [
          "Comprehensive Pilates Instructor",
          "Post-Rehabilitation Specialist",
          "Pre/Post Natal Fitness Certified",
          "Anatomy & Physiology Certified"
        ],
        workExperience: [
          WorkExperience(
            company: "Core Studio",
            position: "Senior Pilates Instructor",
            duration: "2020 - Present",
            achievements: [
              "Trained 300+ clients in Pilates",
              "Specialized in post-injury rehabilitation",
              "Developed prenatal fitness programs",
              "Led teacher training workshops"
            ],
          ),
          WorkExperience(
            company: "Physical Therapy Center",
            position: "Movement Specialist",
            duration: "2017 - 2020",
            achievements: [
              "Worked with physical therapists on rehabilitation",
              "Created movement programs for chronic pain",
              "Specialized in posture correction",
              "Developed home exercise programs"
            ],
          ),
        ],
        socialMedia: {
          "instagram": "@emmawilson_pilates",
          "facebook": "Emma Wilson Pilates",
          "whatsapp": "+1234567893"
        },
      ),
      Trainer(
        name: "David Thompson",
        imagePath: "assets/images/2.png",
        rating: 4.8,
        reviews: 178,
        bio:
            "David is a boxing and martial arts expert who combines traditional boxing techniques with modern fitness principles. He specializes in boxing fitness, self-defense, and helping clients build confidence through physical training.",
        specialization: "Boxing & Martial Arts",
        experienceYears: 10,
        clientsCount: 2200,
        certifications: [
          "Boxing Coach Level 2",
          "Kickboxing Instructor",
          "Self-Defense Instructor",
          "Fitness Boxing Certified"
        ],
        workExperience: [
          WorkExperience(
            company: "Champions Boxing Gym",
            position: "Head Boxing Coach",
            duration: "2019 - Present",
            achievements: [
              "Trained 20+ amateur boxers",
              "Led boxing fitness classes",
              "Organized boxing tournaments",
              "Developed self-defense programs"
            ],
          ),
          WorkExperience(
            company: "Fight Club Fitness",
            position: "Boxing & Fitness Trainer",
            duration: "2015 - 2019",
            achievements: [
              "Created boxing fitness programs",
              "Trained clients in self-defense",
              "Improved client confidence and fitness",
              "Developed youth boxing programs"
            ],
          ),
        ],
        socialMedia: {
          "instagram": "@davidthompson_boxing",
          "facebook": "David Thompson Boxing",
          "whatsapp": "+1234567894"
        },
      ),
      Trainer(
        name: "Lisa Park",
        imagePath: "assets/images/f.png",
        rating: 4.5,
        reviews: 95,
        bio:
            "Lisa is a cycling and cardio specialist who creates high-energy, motivating workouts. She specializes in indoor cycling, endurance training, and helping clients improve their cardiovascular fitness through fun and challenging sessions.",
        specialization: "Cycling & Cardio Fitness",
        experienceYears: 5,
        clientsCount: 1500,
        certifications: [
          "Spinning Instructor Certified",
          "Indoor Cycling Association",
          "Cardio Kickboxing Instructor",
          "Group Fitness Instructor"
        ],
        workExperience: [
          WorkExperience(
            company: "Cycle Studio",
            position: "Lead Cycling Instructor",
            duration: "2021 - Present",
            achievements: [
              "Led 500+ cycling classes",
              "Developed themed cycling programs",
              "Trained new cycling instructors",
              "Created cardio fitness programs"
            ],
          ),
          WorkExperience(
            company: "Fitness Center",
            position: "Group Fitness Instructor",
            duration: "2019 - 2021",
            achievements: [
              "Taught multiple group fitness classes",
              "Specialized in cardio training",
              "Motivated clients to achieve goals",
              "Created high-energy workout routines"
            ],
          ),
        ],
        socialMedia: {
          "instagram": "@lisapark_cycling",
          "facebook": "Lisa Park Cycling",
          "whatsapp": "+1234567895"
        },
      ),
      // Trainer(
      //   name: "James Miller",
      //   imagePath: "assets/images/boy_avatar.png",
      //   rating: 4.9,
      //   reviews: 267,
      //   bio: "James is a HIIT and functional training expert who creates intense, effective workouts that deliver results. He specializes in high-intensity interval training, circuit training, and helping clients push their limits safely and effectively.",
      //   specialization: "HIIT & Functional Training",
      //   experienceYears: 9,
      //   clientsCount: 2800,
      //   certifications: [
      //     "HIIT Specialist Certification",
      //     "Functional Training Specialist",
      //     "TRX Suspension Training",
      //     "Kettlebell Instructor"
      //   ],
      //   workExperience: [
      //     WorkExperience(
      //       company: "Intensity Fitness",
      //       position: "HIIT Training Director",
      //       duration: "2020 - Present",
      //       achievements: [
      //         "Created signature HIIT programs",
      //         "Trained 1000+ clients in HIIT",
      //         "Developed circuit training protocols",
      //         "Led fitness challenges and events"
      //       ],
      //     ),
      //     WorkExperience(
      //       company: "Power Gym",
      //       position: "Functional Training Coach",
      //       duration: "2016 - 2020",
      //       achievements: [
      //         "Specialized in functional movement",
      //         "Trained clients for sports performance",
      //         "Developed injury prevention programs",
      //         "Created home workout programs"
      //       ],
      //     ),
      //   ],
      //   socialMedia: {
      //     "instagram": "@jamesmiller_hiit",
      //     "facebook": "James Miller HIIT",
      //     "whatsapp": "+1234567896"
      //   },
      // ),
      // Trainer(
      //   name: "Rachel Green",
      //   imagePath: "assets/images/trainer_Bg.png",
      //   rating: 4.7,
      //   reviews: 142,
      //   bio: "Rachel is a strength training and bodybuilding specialist who helps clients build muscle, increase strength, and transform their bodies. She focuses on proper form, progressive overload, and creating sustainable training programs.",
      //   specialization: "Strength Training & Bodybuilding",
      //   experienceYears: 11,
      //   clientsCount: 1900,
      //   certifications: [
      //     "ISSA Master Trainer",
      //     "Bodybuilding Specialist",
      //     "Sports Nutrition Coach",
      //     "Corrective Exercise Specialist"
      //   ],
      //   workExperience: [
      //     WorkExperience(
      //       company: "Iron Temple Gym",
      //       position: "Head Strength Coach",
      //       duration: "2019 - Present",
      //       achievements: [
      //         "Trained 400+ strength clients",
      //         "Helped clients achieve bodybuilding goals",
      //         "Developed strength training programs",
      //         "Mentored aspiring bodybuilders"
      //       ],
      //     ),
      //     WorkExperience(
      //       company: "Powerhouse Fitness",
      //       position: "Strength & Conditioning Coach",
      //       duration: "2014 - 2019",
      //       achievements: [
      //         "Specialized in powerlifting training",
      //         "Created strength programs for athletes",
      //         "Improved client strength by 40% average",
      //         "Developed nutrition coaching programs"
      //       ],
      //     ),
      //   ],
      //   socialMedia: {
      //     "instagram": "@rachelgreen_strength",
      //     "facebook": "Rachel Green Strength",
      //     "whatsapp": "+1234567897"
      //   },
      // ),
    ];
  }
}
