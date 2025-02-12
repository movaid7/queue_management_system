import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:queue_management_system/src/common_widgets/button.dart';
import 'package:queue_management_system/src/common_widgets/text_feild.dart';
import 'package:queue_management_system/src/features/queue/presentation/controllers/queue_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPersonScreen extends ConsumerStatefulWidget {
  const AddPersonScreen({Key? key}) : super(key: key);
  @override
  _AddPersonScreenState createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends ConsumerState<AddPersonScreen> {
  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _notesController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Person to Queue')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppTextFormField(
              controller: _fullNameController,
              hintText: 'Name',
              helpText: 'Name of Person',
              obscureText: false,
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              controller: _phoneController,
              hintText: 'Phone Number',
              helpText: 'phone number',
              obscureText: true,
              icon: Icons.phone,
            ),
            const SizedBox(height: 20),
            AppTextFormField(
              controller: _notesController,
              hintText: 'Notes',
              helpText: 'Notes(optional)',
              obscureText: false,
              icon: Icons.note,
            ),
            const SizedBox(height: 20),
            // Use Btn for the button
            _isLoading
                ? const CircularProgressIndicator()
                : Btn(
                    onPress: () async {
                      if (_fullNameController.text.isEmpty ||
                          _phoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please enter both name and phone number'),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      await ref
                          .read(queueControllerProvider.notifier)
                          .addPersonToQueue(
                            _fullNameController.text,
                            _phoneController.text,
                            _notesController.text,
                          );
                      setState(() => _isLoading = false);
                      Navigator.pop(context);
                    },
                    text: 'Add to Queue',
                  ),
          ],
        ),
      ),
    );
  }
}
