import 'package:flutter/material.dart';

import '../login/login_view.dart';
import 'onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: onboardingModels.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(onboardingModels[index].image,
                    fit: BoxFit.fitWidth),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  children: [
                    _buildPageNavigator(index, context),
                    _buildTextColumn(index, context),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildElevatedButtons(context, index),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildElevatedButtons(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            },
            child: const Text("Geç"),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width * 0.3,
                  MediaQuery.of(context).size.height * 0.05),
              primary: Colors.grey,
              elevation: 0,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (index == onboardingModels.length - 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            } else {
              _pageController?.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(MediaQuery.of(context).size.width * 0.3,
                MediaQuery.of(context).size.height * 0.05),
            elevation: 0,
            primary: Colors.orange,
          ),
          child: const Text("İlerle"),
        ),
      ],
    );
  }

  Widget _buildTextColumn(int index, BuildContext context) {
    return Column(
      children: [
        Text(
          onboardingModels[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            onboardingModels[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageNavigator(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (indexDots) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: index == indexDots
                      ? Colors.orange
                      : Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.05),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
