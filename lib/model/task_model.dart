import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? docID;
  final String userId; // Updated to be required
  final String title;
  final String description;
  final String category;
  final String dueDate;
  final String dueTime;
  final bool isDone;
  final String status;
  final String priority; // New field
  final String tag;   // New field

  TaskModel({
    this.docID,
    required this.userId, // userId is required
    required this.title,
    required this.description,
    required this.category,
    required this.dueDate,
    required this.dueTime,
    required this.isDone,
    required this.status,
    required this.priority, // New field
    required this.tag, // New field
  });

  factory TaskModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return TaskModel(
      docID: doc.id,
      userId: data['userId'] ?? '',
      title: data['titleTask'] ?? '',
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      dueDate: data['dateTask'] ?? '',
      dueTime: data['timeTask'] ?? '',
      status: data['status'] ?? '',
      isDone: data['isDone'] ?? false,
      priority: data['priority'] ?? '', // New field
      tag: data['tag'] ?? '', // New field
    );
  }

  // Convert TodoModel instance to a Map for Firestore
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'docID': docID,
      'userId': userId,
      'titleTask': title,
      'description': description,
      'category': category,
      'dateTask': dueDate,
      'timeTask': dueTime,
      'status': status,
      'isDone': isDone,
      'priority': priority, // New field
      'tag': tag, // New field
    };
  }

  // Create a TodoModel instance from a Map retrieved from Firestore
  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      docID: map['docID'] != null ? map['docID'] as String : null,
      userId: map['userId'] as String, // Ensure userId is correctly assigned
      title: map['titleTask'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      dueDate: map['dateTask'] as String,
      dueTime: map['timeTask'] as String,
      isDone: map['isDone'] as bool,
      status: map['status'] as String,
      priority: map['priority'] as String, // New field
      tag: map['tag'] as String, // New field
    );
  }

}
