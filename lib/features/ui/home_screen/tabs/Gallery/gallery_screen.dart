import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/class_gallery_item.dart';
import '../../../../../core/utils/gallery_card.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery')),
      body: FutureBuilder<List<GalleryItem>>(
        future: GalleryDataProvider.getGalleryItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 382 / 214,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GalleryCard(item: snapshot.data![index]);
              },
            );
          } else {
            return const Center(child: Text('No images found.'));
          }
        },
      ),
    );
  }
}
