import 'package:flutter/material.dart';
import 'package:free_talk/services/helper/cache_helper.dart';
import 'package:free_talk/views/routes.dart';
import '../../models/onboarding/onboardingmodel.dart';

class OnboardingProvider extends ChangeNotifier {
  bool _isCompleted = false;
  int _currentPage = 0;

  final PageController boardController = PageController();

  bool get isCompleted => _isCompleted;

  int get currentPage => _currentPage;

  // Boarding data
  final List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Hello',
      body: 'Hello, I’m Mick, Hand talk’s virtual sign language translator and I’m here to help you',
    ),
    BoardingModel(
      title: 'About the app',
      body: 'Globally awarded, the Hand Talk app assists in learning and understanding sign language through artificial intelligence. It currently supports ASL (American Sign Language)',
    ),
    BoardingModel(
      title: 'Connect Effortlessly',
      body: 'The app uses Artificial Intelligence to translate. This means that the characters learn and improve translations with sentences, contexts, and feedback provided. That\'s why sometimes the translations may not be perfect.',
    ),
  ];

  // Method to handle page changes
  void updateCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  // Navigate to the next page
  void onNext(BuildContext context) {
    if (_currentPage < boarding.length - 1) {
      boardController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding(context);
    }
  }

  // Mark onboarding as complete
  void completeOnboarding(BuildContext context) {
    _isCompleted = true;
    notifyListeners();
    CacheHelper.saveData(key: 'opened', value: true);
    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login,(route) => false,);
  }

  @override
  void dispose() {
    boardController.dispose();
    super.dispose();
  }
}
