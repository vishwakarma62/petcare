import 'dio_client.dart';
import 'auth_service.dart';
import 'pet_service.dart';
import 'veterinary_service.dart';
import 'appointment_service.dart';
import 'reminder_service.dart';
import 'medical_record_service.dart';

class ServiceManager {
  static final ServiceManager _instance = ServiceManager._internal();
  factory ServiceManager() => _instance;
  ServiceManager._internal();

  late AuthService authService;
  late PetService petService;
  late VeterinaryService veterinaryService;
  late AppointmentService appointmentService;
  late ReminderService reminderService;
  late MedicalRecordService medicalRecordService;

  Future<void> initialize() async {
    // Initialize DioClient first
    DioClient().init();
    
    // Initialize all services
    authService = AuthService();
    petService = PetService();
    veterinaryService = VeterinaryService();
    appointmentService = AppointmentService();
    reminderService = ReminderService();
    medicalRecordService = MedicalRecordService();
    
    // Load stored token if exists
    await authService.loadStoredToken();
  }
}