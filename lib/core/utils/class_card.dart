import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/app_styels.dart';
import 'package:gym_app_graduation_project/core/utils/class_item.dart';

class ClassCard extends StatelessWidget {
  final ClassItem classItem;

  const ClassCard({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      width: 379,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: ClassCardStyles.containerDecoration,
      child: Row(
        children: [
          Container(
            height: 146,
            width: 146,
            decoration: BoxDecoration(
              borderRadius: ClassCardStyles.imageBorder,
              image: DecorationImage(
                image: NetworkImage(classItem.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(classItem.title, style: ClassCardStyles.titleText),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.person,
                          size: 14, color: ClassCardColors.icon),
                      const SizedBox(width: 4),
                      Text(classItem.trainer,
                          style: ClassCardStyles.trainerText),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(classItem.time, style: ClassCardStyles.timeAndDateText),
                  Text(classItem.date, style: ClassCardStyles.timeAndDateText),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(classItem.price, style: ClassCardStyles.priceText),
                      Text(classItem.spotsLeft,
                          style: ClassCardStyles.spotsLeftText),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
