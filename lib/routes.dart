import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';
import 'screens/phone_input_screen.dart';
import 'screens/verification_code_screen.dart';
import 'screens/user_type_selection_screen.dart';
import 'screens/profile_photo_screen.dart';
import 'screens/personal_info_screen.dart';
import 'screens/worker_details_screen.dart';
import 'screens/search_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/profile_details_screen.dart';

class AppRoutes {
  static const String onboarding = '/';
  static const String phoneInput = '/phone';
  static const String verification = '/verification';
  static const String userType = '/user-type';
  static const String profilePhoto = '/profile-photo';
  static const String personalInfo = '/personal-info';
  static const String workerDetails = '/worker-details';
  static const String search = '/search';
  static const String profile = '/profile';
  static const String profileDetails = '/profile-details';

  static Map<String, WidgetBuilder> routes = {
    onboarding: (context) => const OnboardingScreen(),
    phoneInput: (context) => const PhoneInputScreen(),
    verification: (context) => const VerificationCodeScreen(),
    userType: (context) => const UserTypeSelectionScreen(),
    profilePhoto: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as bool;
      return ProfilePhotoScreen(isWorker: args);
    },
    personalInfo: (context) => const PersonalInfoScreen(),
    workerDetails: (context) => const WorkerDetailsScreen(),
    search: (context) => const SearchScreen(),
    profile: (context) => const ProfileScreen(),
    profileDetails: (context) => const ProfileDetailsScreen(),
  };
}
