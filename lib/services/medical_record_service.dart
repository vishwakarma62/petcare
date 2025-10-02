import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'api_exception.dart';

class MedicalRecordService {
  final DioClient _dioClient = DioClient();

  // Create Health Record
  Future<Map<String, dynamic>> createHealthRecord({
    required int petId,
    String? recordType,
    String? description,
    String? date,
    String? veterinarian,
    String? notes,
  }) async {
    try {
      final result = await _dioClient.post('health-records/', data: {
        'pet': petId,
        'record_type': recordType,
        'description': description,
        'date': date,
        'veterinarian': veterinarian,
        'notes': notes,
      });
      return result.data;
    } catch (e) {
      throw ApiException('Health record creation failed: ${e.toString()}');
    }
  }

  // Get Health Records by Pet
  Future<List<Map<String, dynamic>>> getHealthRecordsByPet(int petId) async {
    try {
      final result = await _dioClient.get('health-records/', queryParameters: {'pet': petId});
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch health records: ${e.toString()}');
    }
  }

  // Get Health Record by ID
  Future<Map<String, dynamic>> getHealthRecordById(int recordId) async {
    try {
      final result = await _dioClient.get('health-records/$recordId/');
      return result.data;
    } catch (e) {
      throw ApiException('Failed to fetch health record: ${e.toString()}');
    }
  }

  // Update Medical Record
  Future<Map<String, dynamic>> updateMedicalRecord({
    required int recordId,
    String? diagnosis,
    String? treatment,
    String? prescription,
    String? notes,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (diagnosis != null) data['diagnosis'] = diagnosis;
      if (treatment != null) data['treatment'] = treatment;
      if (prescription != null) data['prescription'] = prescription;
      if (notes != null) data['notes'] = notes;

      final result = await _dioClient.post('medical-records/$recordId/', data: data);
      return result.data;
    } catch (e) {
      throw ApiException('Medical record update failed: ${e.toString()}');
    }
  }

  // Upload Medical Document
  Future<Map<String, dynamic>> uploadMedicalDocument({
    required int recordId,
    required String filePath,
    String? documentType,
  }) async {
    try {
      final result = await _dioClient.post('medical-records/$recordId/upload/', data: {
        'document': await MultipartFile.fromFile(filePath),
        'document_type': documentType,
      });
      return result.data;
    } catch (e) {
      throw ApiException('Document upload failed: ${e.toString()}');
    }
  }

  // Get Vaccination Records
  Future<List<Map<String, dynamic>>> getVaccinationRecords(int petId) async {
    try {
      final result = await _dioClient.get('medical-records/vaccinations/', queryParameters: {'pet': petId});
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch vaccination records: ${e.toString()}');
    }
  }
}