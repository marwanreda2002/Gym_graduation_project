import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/utils/app_images.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/FilterScreen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_card.dart';

import '../../../../../core/utils/app_styels.dart';

class ClassesTab extends StatelessWidget {
  const ClassesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Classes",
          style: AppStyles.medium24black,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffe2e2e2),
                hintText: "search",
                hintStyle: GoogleFonts.poppins(
                    color: Color(0xff818181),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
                prefixIcon: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilterScreen(),
                        ));
                  },
                  child: Align(
                      widthFactor: 3.w,
                      child: ImageIcon(
                        AssetImage("assets/images/filter_icon.png"),
                        color: Color(0xff8a8a8a),
                      )),
                ),
                suffixIcon: Align(
                    widthFactor: 3.w,
                    child: ImageIcon(
                      AssetImage("assets/images/search_icon.png"),
                      color: Color(0xff8a8a8a),
                    )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.r),
                    borderSide: BorderSide.none),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ClassCard(),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
// import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/FilterScreen.dart';
// import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_card.dart';
// import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/classes_tab/class_service.dart';
// import '../../../../../config/routing/routes.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/class_item.dart';
// import '../../home_screen.dart';
//
// // ignore: camel_case_types
// class class_tab extends StatefulWidget {
//   const class_tab({super.key});
//
//   @override
//   State<class_tab> createState() => _ClassTabState();
// }
//
// class _ClassTabState extends State<class_tab> {
//   late Future<List<ClassItem>> _futureClasses;
//   List<ClassItem> _allClasses = [];
//   List<ClassItem> _filteredClasses = [];
//
//   final TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchClasses(); // نجلب الكلاسات أول ما الشاشة تفتح
//     _searchController.addListener(_filterClasses);
//   }
//
//   // دالة لجلب الكلاسات من السيرفر مع إمكانية تطبيق الفلتر
//   Future<void> _fetchClasses(
//       {String? type, String? date, String? startTime, String? endTime}) async {
//     setState(() {
//       _futureClasses = ClassService().fetchClasses(
//           type: type, date: date, startTime: startTime, endTime: endTime);
//     });
//     _futureClasses.then((data) {
//       setState(() {
//         _allClasses = data;
//         _filteredClasses = data;
//       });
//     });
//   }
//
//   void _filterClasses() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredClasses = _allClasses.where((classItem) {
//         return classItem.title.toLowerCase().contains(query) ||
//             classItem.description.toLowerCase().contains(query);
//       }).toList();
//     });
//   }
//
//   // دالة لفتح شاشة الفلتر واستقبال النتائج
//   Future<void> _openFilterScreen() async {
//     final filterResult = await Navigator.push<Map<String, dynamic>>(
//       context,
//       MaterialPageRoute(builder: (context) => const FilterScreen()),
//     );
//
//     // لو المستخدم اختار فلاتر وضغط على "Apply"
//     if (filterResult != null) {
//       _fetchClasses(
//         type: filterResult['type'],
//         date: filterResult['date'],
//         startTime: filterResult['startTime'],
//         endTime: filterResult['endTime'],
//       );
//     }
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text("Classes",style: AppStyles.medium24black,),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     height: 50,
//                     child: Row(
//                       children: [
//                         const Icon(Icons.search, color: Colors.blue),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: TextField(
//                             controller: _searchController,
//                             decoration: const InputDecoration(
//                               hintText: 'Search',
//                               border: InputBorder.none,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 GestureDetector(
//                   onTap: _openFilterScreen, // استدعاء دالة فتح شاشة الفلتر
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: const Icon(Icons.tune, color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: FutureBuilder<List<ClassItem>>(
//                 future: _futureClasses,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (snapshot.hasData) {
//                     _filteredClasses = snapshot.data!;
//                     return ListView.builder(
//                       itemCount: _filteredClasses.length,
//                       itemBuilder: (context, index) {
//                         return ClassCard();
//                       },
//                     );
//                   } else {
//                     return const Center(child: Text('No classes found.'));
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColors.greyTextColor,
//         onPressed: () {
//           Navigator.pushNamed(context, '/aiChat');
//         },
//         child: const Icon(Icons.smart_toy_outlined),
//       ),
//
//     );
//   }
// }
