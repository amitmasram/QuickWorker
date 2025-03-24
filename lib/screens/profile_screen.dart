import 'package:flutter/material.dart';
import '../constants/text_styles.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/toggle_switch.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        title: const Text(
          'Profile Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileAvatar(
              imageFile: null,
              size: 100,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            const Text(
              'Profile 1',
              style: AppTextStyles.heading,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('4.5'),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Colors.amber, size: 16),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoItem('Profile', 'View All'),
_buildInfoItem('Profile', 'View All'),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Available', style: AppTextStyles.subheading),
                      Text(
                        _isAvailable ? 'You are online' : 'You are offline',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                  ToggleSwitch(
                    value: _isAvailable,
                    onToggle: (value) {
                      setState(() {
                        _isAvailable = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.chat, 'Chat'),
                _buildActionButton(Icons.call, 'Call'),
                _buildActionButton(Icons.location_on, 'Map'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String title, String action) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.subheading),
        TextButton(
          onPressed: () {
            if (action == 'View All') {
              Navigator.pushNamed(context, '/profile-details');
            }
          },
          child: Text(action),
        ),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: Icon(icon),
        ),
        const SizedBox(height: 8),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}
