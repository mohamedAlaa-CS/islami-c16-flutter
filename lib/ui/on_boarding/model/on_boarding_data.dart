import 'package:islami_c16/ui/design.dart';

class OnBoardingData {
  final String image;
  final String title;
  final String? description;

  OnBoardingData({required this.image, required this.title, this.description});

  static List<OnBoardingData> onBoardingList = [
    OnBoardingData(image: AppImages.onBoarding1, title: 'Welcome To Islmi App'),
    OnBoardingData(
      image: AppImages.onBoarding2,
      title: 'Welcome To Islami',
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    OnBoardingData(
      image: AppImages.onBoarding3,
      title: 'Reading the Quran',
      description: 'Read, and your Lord is the Most Generous',
    ),
    OnBoardingData(
      image: AppImages.onBoarding4,
      title: 'Bearish',
      description: 'Praise the name of your Lord, the Most High',
    ),
    OnBoardingData(
      image: AppImages.onBoarding5,
      title: 'Holy Quran Radio',
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
