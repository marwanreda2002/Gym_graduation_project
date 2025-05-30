import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/classes_tab.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/home_tab/home_tab.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_tab.dart';

import '../../../config/routing/routes.dart';
import '../../../core/utils/app_colors.dart';
import '../auth/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> displayed = [
      HomeTab(),
      ClassesTab(),
      TrainerTab(),
      ProfileTab()
    ];
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          shape: CircleBorder(),
          onPressed: () {
            Navigator.pushNamed(context, Routes.chatbot);
          },
          child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) => LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primaryColor,
                      AppColors.blackColor,
                    ],
                  ).createShader(bounds),
              child: ImageIcon(
                AssetImage("assets/images/chatbot_icon.png"),
                size: 32,
              )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.darkGreyColor,
          currentIndex: selectedIndex,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/home_icon_selected.png"),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/classes_icon.png"),
              ),
              label: 'Classes',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/trainer_icon.png"),
              ),
              label: 'Trainer',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/images/profile_icon.png"),
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: displayed[selectedIndex]);
  }
}