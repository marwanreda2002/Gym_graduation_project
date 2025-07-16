import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/data/models/class_model.dart';

class ClassCard extends StatelessWidget {
  final ClassModel classModel;

  const ClassCard({super.key, required this.classModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.classDetails,
            arguments: classModel);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Image
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    classModel.imageUrl,
                    height: 160.h,
                    width: 390.w,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Class Title & Time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            classModel.name,
                            style: AppStyles.regular16black,
                          ),
                          SizedBox(
                            width: 110.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                classModel.timing,
                                style: AppStyles.regular13black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Trainer and spots left
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(
                                'assets/images/trainer_image.png'), // trainer image
                          ),
                          const SizedBox(width: 7),
                          Text(
                            classModel.trainerName,
                            style: AppStyles.regular15grey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Text(
                            "${classModel.capacity} spots left",
                            style: AppStyles.regular15grey,
                          ),
                          SizedBox(
                            width: 160.w,
                          ),
                          Text("${classModel.price} EGP",
                              style: AppStyles.bold16primary),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
