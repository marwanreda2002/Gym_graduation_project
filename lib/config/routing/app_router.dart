import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';
import 'package:gym_app_graduation_project/data/models/class_model.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/age_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/dashboard_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/genedre_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/intro_bmi_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/weight_screen.dart';
import 'package:gym_app_graduation_project/features/ui/auth/login/login_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/home_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/Book/my_bookmarks_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/chat_bot/chat_bot_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_details_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/profile_tab/password_manager_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/profile_tab/update_profile.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_details_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_rating_page.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_tab.dart'
    show TrainerTab;
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/video_player_screen.dart';

import '../../features/ui/BMI/height_screen.dart';
import '../../features/ui/auth/register/register_screen.dart';
import '../../features/ui/home_screen/tabs/trainer_tab/Thank You.dart';
import '../../features/ui/home_screen/tabs/trainer_tab/techniques_details.dart';
import '../../features/ui/onboarding_screen/onboarding_screen.dart';
import 'package:gym_app_graduation_project/features/ui/membership/membership_screen.dart';

class AppRouter {
  Route generateRoure(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
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
        try {
          final trainer = settings.arguments as Trainer;
          return MaterialPageRoute(
            builder: (_) => TrainerDetailsPage(
              trainer: trainer,
              settings: settings,
            ),
          );
        } catch (e) {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('Error: Invalid trainer data'),
              ),
            ),
          );
        }
      case Routes.techniqueDetails:
        return MaterialPageRoute(
          builder: (_) => TechniquesDetails(),
        );
      case Routes.trainerRatingPage:
        try {
          final trainer = settings.arguments as Trainer;
          return MaterialPageRoute(
            builder: (_) => TrainerRatingScreen(trainer: trainer),
            settings: settings,
          );
        } catch (e) {
          return MaterialPageRoute(
            builder: (_) => TrainerRatingScreen(),
            settings: settings,
          );
        }
      case Routes.chatbot:
        return MaterialPageRoute(
          builder: (_) => ChatBotScreen(),
          settings: settings,
        );
      case Routes.thankYouPage:
        return MaterialPageRoute(builder: (_) => ThankYouPage());
      case Routes.classDetails:
        try {
          final classModel = settings.arguments as ClassModel;
          return MaterialPageRoute(
            builder: (_) => ClassDetailsScreen(classModel: classModel),
          );
        } catch (e) {
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('Error: Invalid class data'),
              ),
            ),
          );
        }
      case Routes.updateProfileScreen:
        return MaterialPageRoute(builder: (_) => UpdateProfile());
      case Routes.passwordManagerScreen:
        return MaterialPageRoute(builder: (_) => PasswordManagerScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.videoPlayer:
        final args = settings.arguments;
        if (args is Map<String, dynamic> &&
            args.containsKey('videoUrl') &&
            args.containsKey('videoTitle') &&
            args.containsKey('videoDescription')) {
          return MaterialPageRoute(
            builder: (_) => VideoPlayerScreen(
              videoUrl: args['videoUrl'],
              videoTitle: args['videoTitle'],
              videoDescription: args['videoDescription'],
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Invalid arguments for video player'),
            ),
          ),
        );
      case Routes.membershipScreen:
        return MaterialPageRoute(builder: (_) => const MembershipScreen());
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
