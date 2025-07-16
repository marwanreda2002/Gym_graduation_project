import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get your membership'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMembershipCard(
              title: 'Regular',
              duration: '1 month',
              originalPrice: '600 EGP',
              discountedPrice: '500 EGP',
              imagePath: 'assets/images/image1.png',
              isDiscounted: true,
            ),
            const SizedBox(height: 16),
            _buildMembershipCard(
              title: 'Silver',
              duration: '3 month',
              originalPrice: '1500 EGP',
              discountedPrice: '1000 EGP',
              imagePath: 'assets/images/image2.png',
              isDiscounted: true,
            ),
            const SizedBox(height: 16),
            _buildMembershipCard(
              title: 'Gold',
              duration: '1 Year',
              originalPrice: '1500 EGP',
              discountedPrice: '10000 EGP',
              imagePath: 'assets/images/image3.png',
              isDiscounted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipCard({
    required String title,
    required String duration,
    required String originalPrice,
    required String discountedPrice,
    required String imagePath,
    required bool isDiscounted,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isDiscounted
            ? BorderSide.none
            : const BorderSide(color: Colors.amber, width: 2),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              if (isDiscounted)
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(12)),
                    ),
                    child: const Text(
                      '15% OFF',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold)),
                Text(duration,
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
                if (isDiscounted)
                  Text(originalPrice,
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough)),
                Text(discountedPrice,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
