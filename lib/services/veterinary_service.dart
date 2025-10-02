import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'api_exception.dart';

class VeterinaryService {
  final DioClient _dioClient = DioClient();

  // Get All Providers
  Future<List<Map<String, dynamic>>> getAllProviders() async {
    try {
      final result = await _dioClient.get('providers/');
      // Handle paginated response
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch providers: ${e.toString()}');
    }
  }

  // Search Specialists
  Future<List<Map<String, dynamic>>> searchSpecialists({
    String? query,
    String? specialty,
    String? location,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (query != null && query.isNotEmpty) queryParams['search'] = query;
      if (specialty != null && specialty.isNotEmpty) queryParams['specialty'] = specialty;
      if (location != null && location.isNotEmpty) queryParams['location'] = location;
      
      final result = await _dioClient.get('providers/', queryParameters: queryParams);
      // Handle paginated response
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to search specialists: ${e.toString()}');
    }
  }

  // Get Nearby Specialists
  Future<List<Map<String, dynamic>>> getNearbySpecialists({
    required double latitude,
    required double longitude,
    double? radius,
  }) async {
    try {
      final queryParams = {
        'lat': latitude,
        'lng': longitude,
        if (radius != null) 'radius': radius,
      };
      
      final result = await _dioClient.get('providers/nearby/', queryParameters: queryParams);
      // Handle paginated response
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch nearby specialists: ${e.toString()}');
    }
  }

  // Get Provider by ID
  Future<Map<String, dynamic>> getProviderById(int providerId) async {
    try {
      final result = await _dioClient.get('providers/$providerId/');
      return result.data;
    } catch (e) {
      throw ApiException('Failed to fetch provider: ${e.toString()}');
    }
  }

  // Get Services
  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      final result = await _dioClient.get('services/');
      // Handle paginated response
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch services: ${e.toString()}');
    }
  }

  // Get Service Categories
  Future<List<Map<String, dynamic>>> getServiceCategories() async {
    try {
      final result = await _dioClient.get('categories/');
      // Handle paginated response
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch categories: ${e.toString()}');
    }
  }

  // Get Reviews
  Future<List<Map<String, dynamic>>> getReviews({int? providerId}) async {
    try {
      final queryParams = providerId != null ? {'provider': providerId} : null;
      final result = await _dioClient.get('reviews/', queryParameters: queryParams);
      // Handle paginated response
      if (result.data is Map && result.data.containsKey('results')) {
        return List<Map<String, dynamic>>.from(result.data['results']);
      }
      return List<Map<String, dynamic>>.from(result.data);
    } catch (e) {
      throw ApiException('Failed to fetch reviews: ${e.toString()}');
    }
  }

  // Add to Favorites
  Future<Map<String, dynamic>> addToFavorites(int providerId) async {
    try {
      final result = await _dioClient.post('favorites/', data: {'provider': providerId});
      return result.data;
    } catch (e) {
      throw ApiException('Failed to add favorite: ${e.toString()}');
    }
  }
}