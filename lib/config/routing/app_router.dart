
import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/age_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/dashboard_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/genedre_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/intro_bmi_screen.dart';
import 'package:gym_app_graduation_project/features/ui/BMI/weight_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/home_screen.dart';

import '../../features/ui/BMI/height_screen.dart';

class AppRouter {
  Route generateRoure(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
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
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route for ${settings.name}'),
                  ),
                ));
    }
  }
}
