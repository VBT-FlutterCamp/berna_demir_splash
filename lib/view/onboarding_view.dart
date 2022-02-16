import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:onboarding_splash/strings.dart';
import 'package:onboarding_splash/view/home_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        description: Strings.desc1,
        pathImage: "asset/images/undraw1.jpg",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: Strings.desc2,
        pathImage: "asset/images/undraw2.jpg",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
    slides.add(
      Slide(
        description: Strings.desc3,
        pathImage: "asset/images/undraw3.jpg",
        backgroundColor: Colors.white,
        styleDescription: const TextStyle(color: Colors.black, fontSize: 20.0),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomeView()),
    );
  }

  Widget renderDoneBtn() {
    return const Text(
      "Başla!",
      style: TextStyle(color: Colors.orange),
    );
  }

  Widget renderSkipBtn() {
    return const Text(
      "Geç",
      style: TextStyle(color: Colors.black45),
    );
  }

  Widget renderNextBtn() {
    return const Text(
      "İlerle",
      style: TextStyle(color: Colors.black45),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      slides: slides,
      // Dot indicator
      colorDot: Colors.grey,
      colorActiveDot: Colors.orange,
      sizeDot: 13.0,
      // Skip button
      renderSkipBtn: renderSkipBtn(),
      // Done button
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      // Next button
      renderNextBtn: renderNextBtn(),
    );
  }
}
