import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AppointmentFetchDataController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<Map<String, dynamic>> appointments = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchAppointments();
    super.onInit();
  }

  Future<void> fetchAppointments() async {
    try {
      final snapshot = await _firestore.collection('Appointments').get();
      final docs = snapshot.docs;
      appointments.value = docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching appointments: $e');
    }
  }
}
