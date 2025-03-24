import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../constants/text_styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/profile_avatar.dart';

class ProfilePhotoScreen extends StatefulWidget {
  final bool isWorker;

  const ProfilePhotoScreen({
    Key? key,
    required this.isWorker,
  }) : super(key: key);

  @override
  State<ProfilePhotoScreen> createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Add a Profile photo',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            ProfileAvatar(
              imageFile: _imageFile,
              size: 120,
              onTap: _pickImage,
            ),
            const Spacer(),
            CustomButton(
              text: 'Next',
              onPressed: () => Navigator.pushNamed(context, '/personal-info'),
            ),
          ],
        ),
      ),
    );
  }
}
