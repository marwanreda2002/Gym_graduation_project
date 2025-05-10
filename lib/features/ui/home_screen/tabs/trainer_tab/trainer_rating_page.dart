import 'package:flutter/material.dart';
import 'package:gym_app_graduation_project/core/utils/app_colors.dart';
import 'package:gym_app_graduation_project/features/ui/home_screen/tabs/trainer_tab/trainer_service.dart';

import '../../../../../config/routing/routes.dart' show Routes;
import '../../../../../core/utils/app_styels.dart' show CustomButton;
import '../../../../../core/utils/trainer_details_model.dart' show RatingData;

class TrainerRatingPage extends StatefulWidget {
  final int trainerId;

  const TrainerRatingPage({super.key, required this.trainerId});

  @override
  State<TrainerRatingPage> createState() => _TrainerRatingPageState();
}

class _TrainerRatingPageState extends State<TrainerRatingPage> {
  final _formKey = GlobalKey<FormState>();
  double _rating = 3;
  final TextEditingController _commentController = TextEditingController();
  bool _isSubmitting = false;

  void _submitRating() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final ratingData = RatingData(
      rating: _rating,
      comment: _commentController.text.trim(),
    );

    try {
      await TrainerService.submitRating(widget.trainerId, ratingData);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Successfully rated the trainer')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error_When Send The Scoer:$e')),
      );
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors_Detail.background,
      appBar: AppBar(
        title: const Text('rate the trainer'),
        backgroundColor: AppColors_Detail.primary,
        foregroundColor: AppColors_Detail.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('choise The rated',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Slider(
                value: _rating,
                min: 1,
                max: 5,
                divisions: 4,
                label: _rating.toString(),
                activeColor: AppColors.primary,
                onChanged: (value) => setState(() => _rating = value),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _commentController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'write your comment',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) return 'please enter a comment';
                  return null;
                },
              ),
              const SizedBox(height: 30),
              _isSubmitting
                  ? const CircularProgressIndicator()
                  : CustomButton(
                text: 'Send Rating',
                onPressed: () {
                  _submitRating();
                  Navigator.pushNamed(context, Routes.thankYouPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
