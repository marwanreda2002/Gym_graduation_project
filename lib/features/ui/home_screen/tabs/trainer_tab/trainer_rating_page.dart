import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/components/resuble_components.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/Thank You.dart';

class TrainerRatingScreen extends StatefulWidget {
  final Trainer? trainer;

  const TrainerRatingScreen({
    super.key,
    this.trainer,
  });

  @override
  State<TrainerRatingScreen> createState() => _TrainerRatingScreenState();
}

class _TrainerRatingScreenState extends State<TrainerRatingScreen> {
  double rating = 0;
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final trainer = widget.trainer;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 335.h,
              child: Stack(
                children: [
                  SizedBox(
                    height: 252.h,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/rating_bg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: CustomBackButtonCircle(),
                  ),
                  Positioned(
                    top: 141,
                    left: 125,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff378CE7),
                                Color(0xff0f2d49),
                              ]),
                          borderRadius: BorderRadius.circular(200)),
                      child: CircleAvatar(
                        radius: 90.r,
                        backgroundImage: AssetImage(trainer?.imagePath ??
                            'assets/images/rating_trainer_image.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            Text(
              trainer?.name ?? 'Trainer Name',
              style: AppStyles.semibold18Black,
            ),
            SizedBox(height: 24.h),

            RatingBarIndicator(
              rating: trainer?.rating ?? 4.5,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 30.0,
            ),

            SizedBox(height: 34.h),

            Text(
              'How was your experience with barawy',
              style: AppStyles.regular15black,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'your overall rating for this classes',
              style: AppStyles.regular14grey.copyWith(color: Color(0xff666666)),
            ),

            SizedBox(height: 27.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add detailed review",
                    style: AppStyles.regular16black,
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter here...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 150.h),

            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThankYouPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.r)),
                ),
                child: Text(
                  "Submit",
                  style: AppStyles.regular18white,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
