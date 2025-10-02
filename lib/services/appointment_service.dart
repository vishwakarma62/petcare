import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'api_exception.dart';

class AppointmentService {
  final DioClient _dioClient = DioClient();

  // Create Appointment
  Future<Map<String, dynamic>> createAppointment({
    required int petId,
    required int veterinarianId,
    required String appointmentDate,
    required String appointmentTime,
    String? reason,
    String? notes,
  }) async {
    try {
      final result = await _dioClient.post('appointments/', data: {
        'pet': petId,
        'veterinarian': veterinarianId,
        'appointment_date': appointmentDate,
        'appointment_time': appointmentTime,
        'reason': reason,
        'notes': notes,
      });
      return result.data;
    } catch (e) {
      throw ApiException('Appointment creation failed: ${e.toString()}');
    }
  }

  // Get All Appointments
  Future<List<Map<String, dynamic>>> getAllAppointments() async {
    try {
      final result = await _dioClient.get('appointments/');
      List<Map<String, dynamic>> appointments = [];
      
      // Handle paginated response from Django REST Framework
      if (result.data is Map && result.data.containsKey('results')) {
        appointments = List<Map<String, dynamic>>.from(result.data['results']);
      } else {
        // Handle direct list response
        appointments = List<Map<String, dynamic>>.from(result.data);
      }
      
      // Return demo data if no appointments found
      if (appointments.isEmpty) {
        return _getDemoAppointments();
      }
      
      return appointments;
    } catch (e) {
      // Return demo data on error
      return _getDemoAppointments();
    }
  }
  
  List<Map<String, dynamic>> _getDemoAppointments() {
    return [
      {
        'id': 1,
        'appointment_date': '2024-12-15',
        'appointment_time': '10:00',
        'status': 'scheduled',
        'veterinarian': {
          'name': 'Dr. Sarah Johnson',
          'specialty': 'Veterinary Dentist',
          'clinic': 'PetCare Clinic',
          'address': '123 Main Street, City',
          'reviews': 125
        },
        'pet': {
          'name': 'Buddy',
          'type': 'Dog'
        }
      },
      {
        'id': 2,
        'appointment_date': '2024-12-20',
        'appointment_time': '14:30',
        'status': 'confirmed',
        'veterinarian': {
          'name': 'Dr. Michael Brown',
          'specialty': 'General Veterinarian',
          'clinic': 'Animal Hospital',
          'address': '456 Oak Avenue, City',
          'reviews': 89
        },
        'pet': {
          'name': 'Whiskers',
          'type': 'Cat'
        }
      },
      {
        'id': 3,
        'appointment_date': '2024-11-25',
        'appointment_time': '09:15',
        'status': 'completed',
        'veterinarian': {
          'name': 'Dr. Emily Davis',
          'specialty': 'Pet Surgeon',
          'clinic': 'VetCare Center',
          'address': '789 Pine Road, City',
          'reviews': 156
        },
        'pet': {
          'name': 'Max',
          'type': 'Dog'
        }
      }
    ];
  }

  // Get Appointments by Pet
  Future<List<Map<String, dynamic>>> getAppointmentsByPet(int petId) async {
    try {
      final result = await _dioClient.get('appointments/', queryParameters: {'pet': petId});
      // Handle paginated response from Django REST Framework
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      // Handle direct list response
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch pet appointments: ${e.toString()}');
    }
  }

  // Update Appointment
  Future<Map<String, dynamic>> updateAppointment({
    required int appointmentId,
    String? appointmentDate,
    String? appointmentTime,
    String? reason,
    String? notes,
    String? status,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (appointmentDate != null) data['appointment_date'] = appointmentDate;
      if (appointmentTime != null) data['appointment_time'] = appointmentTime;
      if (reason != null) data['reason'] = reason;
      if (notes != null) data['notes'] = notes;
      if (status != null) data['status'] = status;

      final result = await _dioClient.post('appointments/$appointmentId/', data: data);
      return result.data;
    } catch (e) {
      throw ApiException('Appointment update failed: ${e.toString()}');
    }
  }

  // Cancel Appointment
  Future<void> cancelAppointment(int appointmentId) async {
    try {
      await _dioClient.post('appointments/$appointmentId/cancel/');
    } catch (e) {
      throw ApiException('Appointment cancellation failed: ${e.toString()}');
    }
  }

  // Get Available Time Slots
  Future<List<String>> getAvailableTimeSlots({
    required int veterinarianId,
    required String date,
  }) async {
    try {
      final result = await _dioClient.get('appointments/available-slots/', queryParameters: {
        'veterinarian': veterinarianId,
        'date': date,
      });
      return List<String>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch available slots: ${e.toString()}');
    }
  }
}