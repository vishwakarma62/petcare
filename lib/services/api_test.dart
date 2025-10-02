// import 'package:dio/dio.dart';
// import 'dio_client.dart';
// import 'service_manager.dart';

// class ApiTest {
//   static Future<void> testConnection() async {
//     try {
//       print('🔄 Testing API connection...');
      
//       // Test basic connection
//       final dio = Dio();
//       final response = await dio.get('http://127.0.0.1:8000/api/');
//       print('✅ Base API connection: ${response.statusCode}');
      
//       // Test with DioClient
//       final dioClient = DioClient();
//       final testResponse = await dioClient.get('');
//       print('✅ DioClient connection successful');
      
//     } catch (e) {
//       print('❌ API connection failed: $e');
//       print('💡 Make sure Django server is running at http://127.0.0.1:8000');
//     }
//   }

//   static Future<void> testEndpoints() async {
//     try {
//       final serviceManager = ServiceManager();
      
//       print('🔄 Testing endpoints...');
      
//       // Test pets endpoint
//       try {
//         await serviceManager.petService.getAllPets();
//         print('✅ Pets endpoint working');
//       } catch (e) {
//         print('❌ Pets endpoint failed: $e');
//       }
      
//       // Test veterinarians endpoint
//       try {
//         await serviceManager.veterinaryService.getAllVeterinarians();
//         print('✅ Veterinarians endpoint working');
//       } catch (e) {
//         print('❌ Veterinarians endpoint failed: $e');
//       }
      
//       // Test appointments endpoint
//       try {
//         await serviceManager.appointmentService.getAllAppointments();
//         print('✅ Appointments endpoint working');
//       } catch (e) {
//         print('❌ Appointments endpoint failed: $e');
//       }
      
//     } catch (e) {
//       print('❌ Endpoint testing failed: $e');
//     }
//   }
// }