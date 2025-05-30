import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/features/ui/auth/login/login_screen.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_service.dart';
import '../../../../../config/routing/routes.dart';
import '../../../../../core/utils/app_styels.dart';
import 'trainer_card.dart';
import '../../../../../core/utils/trainer_model.dart';
import '../../home_screen.dart';
import '../classes_tab/classes_tab.dart';

class TrainerTab extends StatefulWidget {
  const TrainerTab({super.key});

  @override
  State<TrainerTab> createState() => _TrainerTabState();
}

class _TrainerTabState extends State<TrainerTab> {
  late Future<List<Trainer>> trainers;

  @override
  void initState() {
    super.initState();
    trainers = TrainerService.fetchTrainers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Trainer",
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
                prefixIcon: Align(
                    widthFactor: 3.w,
                    child: ImageIcon(
                      AssetImage("assets/images/filter_icon.png"),
                      color: Color(0xff8a8a8a),
                    )),
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
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => TrainerCard(),
                itemCount: 16,
              ),
            ),
          ],
        ),
      ),
    );

    // Scaffold(
    //     backgroundColor: AppColors.primaryColor,
    //     body: SafeArea(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Padding(
    //             padding:
    //             const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //             child: Text(
    //               'Trainers',
    //               style: TextStyle(
    //                 fontSize: 32,
    //                 fontWeight: FontWeight.bold,
    //                 color: AppColors.blackColor,
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: FutureBuilder<List<Trainer>>(
    //               future: trainers,
    //               builder: (context, snapshot) {
    //                 if (snapshot.connectionState == ConnectionState.waiting) {
    //                   return Center(child: CircularProgressIndicator());
    //                 } else if (snapshot.hasError) {
    //                   return Center(child: Text('Erro: ${snapshot.error}'));
    //                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
    //                   return Center(child: Text('there is no trainers'));
    //                 } else {
    //                   final trainers = snapshot.data!;
    //                   return GridView.builder(
    //                     padding: EdgeInsets.all(12),
    //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                       crossAxisCount: 2,
    //                       childAspectRatio: 0.9,
    //                       crossAxisSpacing: 10,
    //                       mainAxisSpacing: 12,
    //                     ),
    //                     itemCount: trainers.length,
    //                     itemBuilder: (context, index) {
    //                       return TrainerCard();
    //                     },
    //                   );
    //                 }
    //               },
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       backgroundColor: AppColors.greyTextColor,
    //       onPressed: () {
    //         Navigator.pushNamed(context, '/aiChat');
    //       },
    //       child: Icon(Icons.smart_toy_outlined),
    //     ),
    //     );
  }
}
