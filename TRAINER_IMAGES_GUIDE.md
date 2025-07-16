# Trainer Images Guide

## Current Image Quality Issues

The current trainer images in your app may not look professional enough. Here's how to improve them:

## Recommended Image Specifications

- **Size**: 400x400 pixels minimum (square aspect ratio)
- **Format**: PNG or JPG
- **Quality**: High resolution, professional photos
- **Style**: Fitness professionals in workout attire
- **Background**: Clean, professional backgrounds

## How to Add Better Images

### 1. Prepare Your Images

- Take or source professional photos of fitness trainers
- Ensure they are square aspect ratio (1:1)
- Use high-quality images (at least 400x400 pixels)
- Save as PNG or JPG format

### 2. Add to Assets

1. Place your new trainer images in the `assets/images/` folder
2. Use descriptive names like:
    - `trainer_sarah_professional.png`
    - `trainer_michael_yoga.png`
    - `trainer_alex_strength.png`
    - `trainer_emma_pilates.png`
    - `trainer_david_boxing.png`
    - `trainer_lisa_cycling.png`
    - `trainer_james_hiit.png`
    - `trainer_rachel_bodybuilding.png`

### 3. Update Mock Data

Update the `imagePath` in `lib/core/utils/mock_data.dart`:

```dart
Trainer(
  name: "Sarah Johnson",
  imagePath: "assets/images/trainer_sarah_professional.png", // Update this
  // ... other properties
),
```

### 4. Update pubspec.yaml

Make sure your new images are included in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
```

## Alternative Solutions

### Option 1: Use Professional Stock Photos

- Download professional fitness trainer photos from stock photo websites
- Ensure you have proper licensing
- Rename them appropriately for your app

### Option 2: Use AI-Generated Images

- Use AI tools to generate professional trainer photos
- Ensure the images look realistic and professional
- Maintain consistent style across all trainers

### Option 3: Use Avatar Services

- Use services like DiceBear or UI Faces for professional avatars
- These provide consistent, professional-looking images

## Current Image Paths Used

The app currently uses these images:

- `rating_trainer_image.png` - Sarah Johnson
- `trainer_image.png` - Michael Chen
- `trainer2.png` - Alex Rodriguez
- `female_avatar.png` - Emma Wilson
- `trainer1.png` - David Thompson
- `profile_image.png` - Lisa Park
- `boy_avatar.png` - James Miller
- `trainer_Bg.png` - Rachel Green

## Quick Fix

If you want to quickly improve the current images:

1. Replace the existing trainer images with better quality versions
2. Keep the same filenames to avoid code changes
3. Ensure the new images are the same size and format

## Testing

After adding new images:

1. Run `flutter clean`
2. Run `flutter pub get`
3. Test the app to ensure images display correctly
4. Check both trainer cards and trainer details screens 