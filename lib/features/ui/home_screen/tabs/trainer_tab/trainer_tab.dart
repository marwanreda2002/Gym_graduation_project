import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gym_app_graduation_project/core/utils/mock_data.dart';
import '../../../../../config/routing/routes.dart';
import '../../../../../core/utils/app_styels.dart';
import 'trainer_card.dart';
import '../../../../../core/utils/trainer_model.dart';

class TrainerTab extends StatelessWidget {
  const TrainerTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Get mock trainers data
    final trainers = MockData.getMockTrainers();

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
                itemBuilder: (context, index) =>
                    TrainerCard(trainer: trainers[index]),
                itemCount: trainers.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
