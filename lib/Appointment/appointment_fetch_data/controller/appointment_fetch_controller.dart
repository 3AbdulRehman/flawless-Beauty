import 'package:flawless_beauty/utils/popups/loader.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentFetchDataController extends GetxController {
  var appointments = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchAppointments();
    super.onInit();
  }

  Future<void> fetchAppointments() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('Appointments').get();
      final docs = snapshot.docs;
      appointments.value = docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Ensure 'id' is included
        return data;
      }).toList();
    } catch (e) {
      print('Error fetching appointments: $e');
    }
  }

  Future<void> deleteAppointment(String id) async {
    if (id == null || id.isEmpty) {
      print('Error: Appointment ID is null or empty');
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('Appointments')
          .doc(id)
          .delete();
      print('Successfully deleted appointment with ID: $id');
      // Optionally, remove from local list
      appointments.removeWhere((appointment) => appointment['id'] == id);
      TLoader.successSnackBar(title: 'Success', message: 'Appointment deleted');
    } catch (e) {
      print('Failed to delete appointment: $e');
    }
  }
}
