import '../../core/strings.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel(
      {required this.image, required this.title, required this.description});
}

List<OnboardingModel> onboardingModels = [
  OnboardingModel(
      image: 'asset/images/undraw1.jpg',
      title: Strings.tit1,
      description: Strings.desc1),
  OnboardingModel(
      image: 'asset/images/undraw2.jpg',
      title: Strings.tit2,
      description: Strings.desc2),
  OnboardingModel(
      image: 'asset/images/undraw3.jpg',
      title: Strings.tit3,
      description: Strings.desc3),
];
