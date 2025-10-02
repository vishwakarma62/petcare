import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'api_exception.dart';

class PetService {
  final DioClient _dioClient = DioClient();

  // Create Pet
  Future<Map<String, dynamic>> createPet({
    required int owner,
    required String name,
    required String breed,
    required int age,
    required String gender,
    double? weight,
    String? color,
    String? microchipId,
    String? profilePicturePath,
  }) async {
    try {
      final data = <String, dynamic>{
        "owner": owner,
        "name": name,
        "breed": breed,
        "age": age,
        "gender": gender,
      };
      
      if (weight != null) data["weight"] = weight;
      if (color != null) data["color"] = color;
      if (microchipId != null && microchipId.isNotEmpty) data["microchip_id"] = microchipId;
      if (profilePicturePath?.isNotEmpty ?? false) {
        data["profile_picture"] = await MultipartFile.fromFile(profilePicturePath!);
      }
      
      final result = await _dioClient.post('pets/', data: data);
      return result.data;
    } catch (e) {
      throw ApiException('Pet creation failed: ${e.toString()}');
    }
  }

  // Get All Pets
  Future<List<Map<String, dynamic>>> getAllPets() async {
    try {
      final result = await _dioClient.get('pets/');
      final data = result.data;
      
      // Handle paginated response
      if (data is Map && data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(data['results']);
      }
      // Handle direct list response
      else if (data is List) {
        return List<Map<String, dynamic>>.from(data);
      }
      
      return [];
    } catch (e) {
      throw ApiException('Failed to fetch pets: ${e.toString()}');
    }
  }

  // Get Pet by ID
  Future<Map<String, dynamic>> getPetById(int petId) async {
    try {
      final result = await _dioClient.get('pets/$petId/');
      return result.data;
    } catch (e) {
      throw ApiException('Failed to fetch pet: ${e.toString()}');
    }
  }

  // Update Pet
  Future<Map<String, dynamic>> updatePet({
    required int petId,
    String? name,
    String? breed,
    int? age,
    String? gender,
    double? weight,
    String? color,
    String? microchipId,
    String? profilePicturePath,
  }) async {
    try {
      final data = <String, dynamic>{};
      if (name != null) data['name'] = name;
      if (breed != null) data['breed'] = breed;
      if (age != null) data['age'] = age;
      if (gender != null) data['gender'] = gender;
      if (weight != null) data['weight'] = weight;
      if (color != null) data['color'] = color;
      if (microchipId != null) data['microchip_id'] = microchipId;
      if (profilePicturePath?.isNotEmpty ?? false) {
        data['profile_picture'] = await MultipartFile.fromFile(profilePicturePath!);
      }

      final result = await _dioClient.put('pets/$petId/', data: data);
      return result.data;
    } catch (e) {
      throw ApiException('Pet update failed: ${e.toString()}');
    }
  }

  // Delete Pet
  Future<void> deletePet(int petId) async {
    try {
      await _dioClient.delete('pets/$petId/');
    } catch (e) {
      throw ApiException('Pet deletion failed: ${e.toString()}');
    }
  }

  // Get Pets by Owner
  Future<List<Map<String, dynamic>>> getPetsByOwner(int ownerId) async {
    try {
      final result = await _dioClient.get('pets/', queryParameters: {'owner': ownerId});
      final data = result.data;
      
      // Handle paginated response
      if (data is Map && data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(data['results']);
      }
      // Handle direct list response
      else if (data is List) {
        return List<Map<String, dynamic>>.from(data);
      }
      
      return [];
    } catch (e) {
      throw ApiException('Failed to fetch owner pets: ${e.toString()}');
    }
  }
}
