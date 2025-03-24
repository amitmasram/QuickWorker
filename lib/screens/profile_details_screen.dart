import 'package:flutter/material.dart';
import '../constants/text_styles.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/custom_button.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildProfileSection(),
                    _buildEditSection(),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              _buildUserInfoCard(),
              const SizedBox(height: 20),
              _buildReviewsSection(),
              const SizedBox(height: 20),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      children: [
        ProfileAvatar(
          imageFile: null,
          size: 80,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        const Text(
          'Name: Sarahah worker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          'Add: Garnered, Pepper',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildEditSection() {
    return Column(
      children: [
        ProfileAvatar(
          imageFile: null,
          size: 80,
          onTap: () {},
        ),
        const SizedBox(height: 8),
        const Text(
          'Update the Info',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildUserInfoCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Reviews', style: AppTextStyles.subheading),
          const SizedBox(height: 16),
          _buildReviewItem('⭐⭐⭐⭐⭐', 'Great service, very professional!'),
          const SizedBox(height: 8),
          _buildReviewItem('⭐⭐⭐⭐', 'Good work, arrived on time.'),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String stars, String comment) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(stars),
              Text(comment, style: AppTextStyles.caption),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Reviews', style: AppTextStyles.subheading),
          SizedBox(height: 8),
          Text('No reviews yet.', style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Chat'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Go'),
            ),
          ),
        ],
      ),
    );
  }
}
