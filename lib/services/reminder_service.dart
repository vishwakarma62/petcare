import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'api_exception.dart';

class ReminderService {
  final DioClient _dioClient = DioClient();

  // Create Reminder
  Future<Map<String, dynamic>> createReminder({
    required int petId,
    required String title,
    required String reminderDate,
    required String reminderTime,
    String? description,
    String? reminderType,
    bool isRecurring = false,
    String? recurringInterval,
  }) async {
    try {
      final result = await _dioClient.post('reminders/', data: {
        'pet': petId,
        'title': title,
        'reminder_date': reminderDate,
        'reminder_time': reminderTime,
        'description': description,
        'reminder_type': reminderType,
        'is_recurring': isRecurring,
        'recurring_interval': recurringInterval,
      });
      return result.data;
    } catch (e) {
      throw ApiException('Reminder creation failed: ${e.toString()}');
    }
  }

  // Get All Reminders
  Future<List<Map<String, dynamic>>> getAllReminders() async {
    try {
      final result = await _dioClient.get('reminders/');
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch reminders: ${e.toString()}');
    }
  }

  // Get Reminders by Pet
  Future<List<Map<String, dynamic>>> getRemindersByPet(int petId) async {
    try {
      final result = await _dioClient.get('reminders/', queryParameters: {'pet': petId});
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch pet reminders: ${e.toString()}');
    }
  }

  // Update Reminder
  Future<Map<String, dynamic>> updateReminder({
    required int reminderId,
    String? title,
    String? reminderDate,
    String? reminderTime,
    String? description,
    String? reminderType,
    bool? isRecurring,
    String? recurringInterval,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (title != null) data['title'] = title;
      if (reminderDate != null) data['reminder_date'] = reminderDate;
      if (reminderTime != null) data['reminder_time'] = reminderTime;
      if (description != null) data['description'] = description;
      if (reminderType != null) data['reminder_type'] = reminderType;
      if (isRecurring != null) data['is_recurring'] = isRecurring;
      if (recurringInterval != null) data['recurring_interval'] = recurringInterval;

      final result = await _dioClient.post('reminders/$reminderId/', data: data);
      return result.data;
    } catch (e) {
      throw ApiException('Reminder update failed: ${e.toString()}');
    }
  }

  // Delete Reminder
  Future<void> deleteReminder(int reminderId) async {
    try {
      await _dioClient.post('reminders/$reminderId/delete/');
    } catch (e) {
      throw ApiException('Reminder deletion failed: ${e.toString()}');
    }
  }

  // Mark Reminder as Completed
  Future<void> markReminderCompleted(int reminderId) async {
    try {
      await _dioClient.post('reminders/$reminderId/complete/');
    } catch (e) {
      throw ApiException('Failed to mark reminder as completed: ${e.toString()}');
    }
  }

  // Get Today's Reminders
  Future<List<Map<String, dynamic>>> getTodayReminders() async {
    try {
      final result = await _dioClient.get('reminders/today/');
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch today reminders: ${e.toString()}');
    }
  }
}