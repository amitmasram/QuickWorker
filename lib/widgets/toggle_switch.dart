import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onToggle;

  const ToggleSwitch({
    Key? key,
    required this.value,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onToggle,
      activeColor: AppColors.primary,
      activeTrackColor: AppColors.primary.withOpacity(0.4),
    );
  }
}
