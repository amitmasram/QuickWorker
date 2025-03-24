import 'package:flutter/material.dart';
import '../constants/text_styles.dart';
import '../widgets/custom_button.dart';

class UserTypeSelectionScreen extends StatelessWidget {
  const UserTypeSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text(
                'Choose one on your profile',
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              _buildOption(
                context,
                'I\'m a worker',
                () => Navigator.pushNamed(context, '/profile-photo', arguments: true),
              ),
              const SizedBox(height: 20),
              _buildOption(
                context,
                'I\'m looking for worker',
                () => Navigator.pushNamed(context, '/profile-photo', arguments: false),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.body,
          ),
        ),
      ),
    );
  }
}
