import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app_graduation_project/config/routing/routes.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.classDetails);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Image
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.asset(
                    'assets/images/class_image.png',
                    // Use your actual image path
                    height: 160.h,
                    width: 390.w,
                    fit: BoxFit.fill,
                  ),
                ),

                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Class Title & Time
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Zomba Class",
                            style: AppStyles.regular16black,
                          ),
                          SizedBox(
                            width: 110.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "05:00 PM ",
                                  style: AppStyles.regular13black,
                                  children: [
                                    TextSpan(
                                      text: "to ",
                                      style: AppStyles.regular16primary,
                                    ),
                                    TextSpan(
                                      text: "07:00 PM",
                                      style: AppStyles.regular13black,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "07 DEC 2024",
                                style: AppStyles.regular13grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      // Trainer and spots left
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(
                                'assets/images/trainer_image.png'), // trainer image
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Fady Fouad",
                            style: AppStyles.regular15grey,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      Row(
                        children: [
                          Text(
                            "15 spots left",
                            style: AppStyles.regular15grey,
                          ),
                          SizedBox(
                            width: 110.w,
                          ),
                          Text(
                            "2000 EGP",
                            style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Color(0xff6F6F6F),
                                color: Color(0xff6F6F6F),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(width: 8),
                          Text("1000 EGP", style: AppStyles.bold16primary),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),

            // 15% Offer Tag
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Text(
                  "15% offer",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

            // Blue Arrow
          ],
        ),
      ),
    );
  }
}
