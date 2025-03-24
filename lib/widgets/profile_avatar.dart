import 'dart:io';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileAvatar extends StatelessWidget {
  final File? imageFile;
  final double size;
  final VoidCallback onTap;

  const ProfileAvatar({
    Key? key,
    this.imageFile,
    required this.size,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
          image: imageFile != null
              ? DecorationImage(
                  image: FileImage(imageFile!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageFile == null
            ? Icon(
                Icons.camera_alt,
                color: Colors.grey[400],
                size: size * 0.4,
              )
            : null,
      ),
    );
  }
}
