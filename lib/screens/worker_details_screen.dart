import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

import '../widgets/cutom_text_field.dart';

class WorkerDetailsScreen extends StatefulWidget {
  const WorkerDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {
  final _workExperienceController = TextEditingController();
  final _hourlyRateController = TextEditingController();
  final _shopNumberController = TextEditingController();

  @override
  void dispose() {
    _workExperienceController.dispose();
    _hourlyRateController.dispose();
    _shopNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Work Experience',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              label: 'Work Experience',
              controller: _workExperienceController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Rate (hourly)',
              controller: _hourlyRateController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Shop No.',
              controller: _shopNumberController,
            ),
            const Spacer(),
            CustomButton(
              text: 'Save & Continue',
              onPressed: () => Navigator.pushNamed(context, '/search'),
            ),
          ],
        ),
      ),
    );
  }
}
