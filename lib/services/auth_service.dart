import 'dio_client.dart';
import 'api_exception.dart';

class AuthService {
  final DioClient _dioClient = DioClient();

  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final response = await _dioClient.post('auth/register/', data: {
        'username': username,
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
      });
      return response.data;
    } catch (e) {
      throw ApiException('Registration failed: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dioClient.post('auth/login/', data: {
        'username': username,
        'password': password,
      });
      return response.data;
    } catch (e) {
      throw ApiException('Login failed: ${e.toString()}');
    }
  }
}