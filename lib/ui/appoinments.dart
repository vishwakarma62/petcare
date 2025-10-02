import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/service_manager.dart';
import '../intl/appcolor.dart';

class Appoinments extends StatefulWidget {
  const Appoinments({super.key});

  @override
  State<Appoinments> createState() => _AppoinmentsState();
}

class _AppoinmentsState extends State<Appoinments> {
  bool upcomming = true;
  bool past = false;
  final ServiceManager _serviceManager = ServiceManager();
  List<Map<String, dynamic>> _appointments = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  Future<void> _fetchAppointments() async {
    try {
      final appointments = await _serviceManager.appointmentService.getAllAppointments();
      setState(() {
        _appointments = appointments;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching appointments: $e');
    }
  }

  List<Map<String, dynamic>> get _upcomingAppointments {
    final now = DateTime.now();
    return _appointments.where((apt) {
      try {
        final aptDate = DateTime.parse(apt['appointment_date']);
        return aptDate.isAfter(now);
      } catch (e) {
        return false;
      }
    }).toList();
  }

  List<Map<String, dynamic>> get _pastAppointments {
    final now = DateTime.now();
    return _appointments.where((apt) {
      try {
        final aptDate = DateTime.parse(apt['appointment_date']);
        return aptDate.isBefore(now);
      } catch (e) {
        return false;
      }
    }).toList();
  }

  Future<void> _cancelAppointment(int appointmentId) async {
    try {
      await _serviceManager.appointmentService.cancelAppointment(appointmentId);
      _fetchAppointments(); // Refresh list
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appointment cancelled successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error cancelling appointment: $e')),
      );
    }
  }

  Widget _buildNoAppointmentsWidget(String message) {
    return Container(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: 120,
                  height: 120,
                  child: SvgPicture.asset(
                    "assets/images/icon clock.svg",
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                height: 11,
              ),
              Text(
                message,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.19,
                    color: AppColor.figmadevider),
              ),
              const SizedBox(height: 200),
              Container(
                width: 240,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColor.figmavoilet,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                    child: Text(
                  "Find a specialist",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                )),
              ),
              const SizedBox(
                height: 58,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(Map<String, dynamic> appointment, {bool isPast = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: AppColor.lightgray2,
                blurRadius: 6,
                offset: Offset(0, 4)),
            BoxShadow(
                color: AppColor.lightgray2,
                blurRadius: 6,
                offset: Offset(12, 0)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 24),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 88,
                    height: 88,
                    child: Image.asset(
                      "assets/images/Rectangle 2.1.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          appointment['veterinarian']?['name'] ?? "Dr. Unknown",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0.39,
                              color: AppColor.figmablacktext),
                        ),
                        Text(appointment['veterinarian']?['specialty'] ?? "Veterinarian",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: AppColor.figmablacktext)),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/5.svg"),
                            const SizedBox(width: 5),
                            Text("${appointment['veterinarian']?['reviews'] ?? 0} Reviews",
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: AppColor.ratting,
                                    letterSpacing: 0.9)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 112,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.lightgray2,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: AppColor.lightgray,
                                radius: 16,
                                child: SvgPicture.asset("assets/images/work.svg")),
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      appointment['veterinarian']?['clinic'] ?? "Veterinary Clinic",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: AppColor.figmablacktext,
                                      )),
                                  Text(
                                      appointment['veterinarian']?['address'] ?? "Address not available",
                                      style: TextStyle(
                                          fontSize: 12.5,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          color: AppColor.figmablacktext,
                                          letterSpacing: 0.29)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: AppColor.lightgray,
                                radius: 16,
                                child: SvgPicture.asset("assets/images/icon clock2.svg")),
                            Padding(
                              padding: EdgeInsets.only(left: 16.0),
                              child: Text(
                                  "${appointment['appointment_date']} — ${appointment['appointment_time']}",
                                  style: TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      color: AppColor.figmablacktext,
                                      letterSpacing: 0.29)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (!isPast)
                Padding(
                  padding: const EdgeInsets.only(top: 23.0, right: 20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColor.figmavoilet,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 47.5, vertical: 7),
                          child: Center(
                            child: Text("Edit",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () => _cancelAppointment(appointment['id']),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.lightgray2,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 47.5, vertical: 7),
                            child: Center(
                              child: Text("Cancel",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: AppColor.figmablacktext,
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 176,
           decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.lightgray2,
                offset: Offset(0, 40),
                blurRadius: 20,
              )
            ],
             color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
           ),
            child: Column(
              children: [
                const SizedBox(
                  height: 53,
                ),
                const Text(
                  "Appointment",
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColor.figmablacktext,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal),
                ),
                const SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 38,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.stepper),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                upcomming = true;
                                past = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: upcomming
                                    ? AppColor.figmavoilet
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("Upcoming",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: upcomming
                                            ? Colors.white
                                            : AppColor.figmablacktext)),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                upcomming = false;
                                past = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    past ? AppColor.figmavoilet : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text("Past",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.normal,
                                        color: past
                                            ? Colors.white
                                            : AppColor.figmablacktext)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 32,),
        
          if (past == true)
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _pastAppointments.isEmpty
                      ? _buildNoAppointmentsWidget("No past appointments")
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: _pastAppointments.map((appointment) {
                                return _buildAppointmentCard(appointment, isPast: true);
                              }).toList(),
                            ),
                          ),
                        ),
            ),
         
          if (upcomming == true)
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : _upcomingAppointments.isEmpty
                      ? _buildNoAppointmentsWidget("No upcoming appointments")
                      : SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: _upcomingAppointments.map((appointment) {
                                return _buildAppointmentCard(appointment);
                              }).toList(),
                            ),
                          ),
                        ),
            ),
        ],
      ),
    );
  }
}