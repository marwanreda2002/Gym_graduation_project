import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/FilterScreen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_service.dart';
import '../../../../../config/routing/routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/class_card.dart';
import '../../../../../core/utils/class_item.dart';
import '../../home_screen.dart';

// ignore: camel_case_types
class class_tab extends StatefulWidget {
  const class_tab({super.key});

  @override
  State<class_tab> createState() => _ClassTabState();
}

class _ClassTabState extends State<class_tab> {
  late Future<List<ClassItem>> _futureClasses;
  List<ClassItem> _allClasses = [];
  List<ClassItem> _filteredClasses = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchClasses(); // نجلب الكلاسات أول ما الشاشة تفتح
    _searchController.addListener(_filterClasses);
  }

  // دالة لجلب الكلاسات من السيرفر مع إمكانية تطبيق الفلتر
  Future<void> _fetchClasses(
      {String? type, String? date, String? startTime, String? endTime}) async {
    setState(() {
      _futureClasses = ClassService().fetchClasses(
          type: type, date: date, startTime: startTime, endTime: endTime);
    });
    _futureClasses.then((data) {
      setState(() {
        _allClasses = data;
        _filteredClasses = data;
      });
    });
  }

  void _filterClasses() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredClasses = _allClasses.where((classItem) {
        return classItem.title.toLowerCase().contains(query) ||
            classItem.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  // دالة لفتح شاشة الفلتر واستقبال النتائج
  Future<void> _openFilterScreen() async {
    final filterResult = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const FilterScreen()),
    );

    // لو المستخدم اختار فلاتر وضغط على "Apply"
    if (filterResult != null) {
      _fetchClasses(
        type: filterResult['type'],
        date: filterResult['date'],
        startTime: filterResult['startTime'],
        endTime: filterResult['endTime'],
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 253, 253),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Classes',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("Bookmark clicked");
                        },
                        child: const Icon(Icons.bookmark,
                            size: 32, color: Colors.blue),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.blue),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: _openFilterScreen, // استدعاء دالة فتح شاشة الفلتر
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.tune, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: FutureBuilder<List<ClassItem>>(
                  future: _futureClasses,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      _filteredClasses = snapshot.data!;
                      return ListView.builder(
                        itemCount: _filteredClasses.length,
                        itemBuilder: (context, index) {
                          return ClassCard(classItem: _filteredClasses[index]);
                        },
                      );
                    } else {
                      return const Center(child: Text('No classes found.'));
                    }
                  },
                ),
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
        child: const Icon(Icons.smart_toy_outlined),
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
                    return const HomeScreen();
                  } else if (route == Routes.class_Tab) {
                    return const class_tab();
                    // } else if(route == Routes.) {
                    //   return ;
                    // }else if(route == Routes.) {
                    //   return;
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
      ),
    );
  }
}
