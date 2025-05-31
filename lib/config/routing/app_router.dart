import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/age_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/dashboard_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/genedre_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/intro_bmi_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/weight_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/home_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/Book/my_bookmarks_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/chat_bot/chat_bot_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_details_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_details_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_rating_page.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_tab.dart'
    show TrainerTab;

import '../../features/ui/BMI/height_screen.dart';
import '../../features/ui/home_screen/tabs/trainer_tab/Thank You.dart';
import '../../features/ui/home_screen/tabs/trainer_tab/techniques_details.dart';

class AppRouter {
  Route generateRoure(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.introBmiScreen:
        return MaterialPageRoute(builder: (_) => const IntroBmiScreen());
      case Routes.genderScreen:
        return MaterialPageRoute(builder: (_) => const GenderScreen());
      case Routes.heightScreen:
        return MaterialPageRoute(
            builder: (_) => const HeightScreen(), settings: settings);
      case Routes.weightScreen:
        return MaterialPageRoute(
            builder: (_) => const WeightScreen(), settings: settings);
      case Routes.ageScreen:
        return MaterialPageRoute(
            builder: (_) => const AgeScreen(), settings: settings);
      case Routes.dashboardScreen:
        return MaterialPageRoute(
            builder: (_) => const DashboardScreen(), settings: settings);
      case Routes.trainerTab:
        return MaterialPageRoute(
            builder: (_) => const TrainerTab(), settings: settings);
      case Routes.myBookmarksScreen:
        return MaterialPageRoute(
            builder: (_) => const MyBookmarksScreen(), settings: settings);
      case Routes.trainerDetailsPage:
        final trainerId =
        settings.arguments is int ? settings.arguments as int : 0;
        return MaterialPageRoute(
          builder: (_) => TrainerDetailsPage(
            trainerId: trainerId,
            settings: settings,
          ),
        );
      case Routes.techniqueDetails:
        return MaterialPageRoute(
          builder: (_) => TechniquesDetails(),
        );
      case Routes.trainerRatingPage:
        return MaterialPageRoute(
          builder: (_) => TrainerRatingScreen(),
          settings: settings,
        );
      case Routes.chatbot:
        return MaterialPageRoute(
          builder: (_) => ChatBotScreen(),
          settings: settings,
        );
      case Routes.thankYouPage:
        return MaterialPageRoute(builder: (_) => ThankYouPage());
      case Routes.classDetails:
        return MaterialPageRoute(builder: (_) => ClassDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
