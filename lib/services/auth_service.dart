import 'dio_client.dart';
import 'api_exception.dart';
import 'token_storage.dart';

class AuthService {
  final DioClient _dioClient = DioClient();

  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phone,
  }) async {
    try {
      final response = await _dioClient.post('auth/register/', data: {
        'username': username,
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        if (phone != null) 'phone': phone,
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
      
      final data = response.data;
      if (data['token'] != null) {
        await TokenStorage.saveToken(
          data['token'],
          userId: data['user_id'],
        );
        _dioClient.setAuthToken(data['token']);
      }
      
      return data;
    } catch (e) {
      throw ApiException('Login failed: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    await TokenStorage.clearToken();
    _dioClient.clearAuthToken();
  }

  Future<bool> isLoggedIn() async {
    return await TokenStorage.hasToken();
  }

  Future<void> loadStoredToken() async {
    final token = await TokenStorage.getToken();
    if (token != null) {
      _dioClient.setAuthToken(token);
    }
  }
}