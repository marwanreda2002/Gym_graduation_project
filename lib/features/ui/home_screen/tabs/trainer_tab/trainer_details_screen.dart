import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/core/utils/trainer_details_model.dart';

import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_service.dart';

import '../../../../../config/routing/routes.dart' show Routes;

class TrainerDetailsPage extends StatefulWidget {
  final int trainerId;

  const TrainerDetailsPage(
      {super.key, required this.trainerId, required RouteSettings settings});

  @override
  State<TrainerDetailsPage> createState() => _TrainerDetailsPageState();
}

class _TrainerDetailsPageState extends State<TrainerDetailsPage> {
  late Future<TrainerDetails> _trainerDetailsFuture;

  @override
  void initState() {
    super.initState();
    _trainerDetailsFuture =
        TrainerService.fetchTrainerDetails(widget.trainerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors_Detail.background,
      appBar: AppBar(
        title: const Text('Trainer Details'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.whiteColor,
      ),
      body: FutureBuilder<TrainerDetails>(
        future: _trainerDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final details = snapshot.data!;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRatingClients(details),
                const SizedBox(height: 16),
                _buildExperience(details.experience),
                const SizedBox(height: 16),
                _buildSocialMedia(details.social),
                const SizedBox(height: 16),
                _buildTechniques(details.techniques),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRatingClients(TrainerDetails details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Rating: ${details.rating}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('Clients: ${details.clients}',
            style: const TextStyle(fontSize: 16, color: Colors.grey)),
      ],
    );
  }

  Widget _buildExperience(List<String> experience) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Experience:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...experience.map((e) => Text('• $e', style: const TextStyle(color: Colors.grey))),
      ],
    );
  }

  Widget _buildSocialMedia(SocialMedia social) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Social Media:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Facebook: ${social.facebook}',
            style: const TextStyle(color: Colors.grey)),
        Text('Instagram: ${social.instagram}',
            style: const TextStyle(color: Colors.grey)),
        Text('WhatsApp: ${social.whatsapp}',
            style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.trainerRatingPage);
          },
          child: const Text(
            'Rate',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTechniques(List<Technique> techniques) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Techniques:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...techniques.map(
              (tech) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            child: ListTile(
              title: Text(tech.muscleGroup),
              subtitle: Text(
                  'Rating: ${tech.rating} ⭐ | Reviews: ${tech.reviewCount}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.pushNamed(context, Routes.techniqueVideosPage);
              },
            ),
          ),
        ),
      ],
    );
  }
}
