import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final Trainer trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        {
          Navigator.pushNamed(context, Routes.trainerDetailsPage);
        }
      },
      child: Container(
        width: 179.w,
        height: 162.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 103.33,
                width: 155,
                child: Image.asset(
                  trainer.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                trainer.rating.toInt(),
                    (index) => Icon(Icons.star, color: AppColors.star, size: 16),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              '(${trainer.reviews} Review)',
              style: TextStyle(color: AppColors.greyText, fontSize: 12),
            ),
            const SizedBox(height: 3),
            Text(
              trainer.name,
              style: TextStyle(color: AppColors.blackColor, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
