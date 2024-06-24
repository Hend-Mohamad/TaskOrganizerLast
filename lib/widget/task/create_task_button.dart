import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_app/model/task_model.dart';
import 'package:task_app/provider/date_time_provider.dart';
import 'package:task_app/provider/radio_provider.dart';
import 'package:task_app/provider/service_provider.dart';

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({
    Key? key,
    required this.ref,
    required this.userId, // Add userId parameter here
    required this.titleController,
    required this.descriptionController,
    required this.status, // Add status parameter
    required this.priority, // Add priority parameter
    required this.tag, // Add tag parameter
  }) : super(key: key);

  final WidgetRef ref;
  final String userId; // Declare userId here
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final String status; // Declare status here
  final String priority; // Declare priority here
  final String tag; // Declare tag here

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff8145E5),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {
          final getRadioValue = ref.read(radioProvider);
          String category = '';

          switch (getRadioValue) {
            case 1:
              category = 'Learning';
              break;
            case 2:
              category = 'Working';
              break;
            case 3:
              category = 'General';
              break;
          }

          // Use userId parameter here
          ref.read(serviceProvider).addNewTask(TaskModel(
            userId: userId,
            title: titleController.text,
            description: descriptionController.text,
            category: category,
            dueDate: ref.read(dateProvider),
            dueTime: ref.read(timeProvider),
            isDone: false,
            status: status,
            priority: priority,
            tag: tag,
          ));

          titleController.clear();
          descriptionController.clear();
          ref.read(radioProvider.notifier).update((state) => 0);
          Navigator.pop(context);
        },
        child: const Text(
          'Create',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
