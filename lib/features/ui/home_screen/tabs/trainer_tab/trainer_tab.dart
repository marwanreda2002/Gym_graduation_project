import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_service.dart';
import '../../../../../config/routing/routes.dart';
import '../../../../../core/utils/trainer_card.dart';
import '../../../../../core/utils/trainer_model.dart';
import '../../home_screen.dart';
import '../classes_tab/classes_tab.dart';

class Tainertab extends StatefulWidget {
  const Tainertab({super.key});

  @override
  State<Tainertab> createState() => _TainertabState();
}

class _TainertabState extends State<Tainertab> {
  late Future<List<Trainer>> trainers;

  @override
  void initState() {
    super.initState();
    trainers = TrainerService.fetchTrainers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Trainers',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<Trainer>>(
                  future: trainers,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('there is no trainers'));
                    } else {
                      final trainers = snapshot.data!;
                      return GridView.builder(
                        padding: EdgeInsets.all(12),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: trainers.length,
                        itemBuilder: (context, index) {
                          return TrainerCard(trainer: trainers[index]);
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.greyText,
          onPressed: () {
            Navigator.pushNamed(context, '/aiChat');
          },
          child: Icon(Icons.smart_toy_outlined),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.blackColor,
          selectedItemColor: AppColors.blackColor,
          unselectedItemColor: AppColors.blackColor,
          currentIndex: 2,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: (index) {
            String route = '';
            if (index == 0) {
              route = Routes.homeScreen;
            } else if (index == 1) {
              route = Routes.class_Tab;
            }
            print('Selected route: $route');
            if (route.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    if (route == Routes.homeScreen) {
                      return HomeScreen();
                    } else if (route == Routes.class_Tab) {
                      return class_tab();
                      // } else if(route == Routes.) {
                      //   return ;
                      // }else if(route == Routes.) {
                      //   return;
                    } else {
                      return Scaffold(
                        body: Center(
                          child: Text('Unknown route: $route'),
                        ),
                      );
                    }
                  },
                ),
              );
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement_outlined),
              label: 'Classes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.smart_toy),
              label: 'Trainer',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ));
  }
}
