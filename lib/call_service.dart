import 'package:cloud_firestore/cloud_firestore.dart';

class CallService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> startCall(String callerId, String receiverId) async {
    await _firestore.collection('calls').doc(callerId).set({
      'callerId': callerId,
      'receiverId': receiverId,
      'timestamp': DateTime.now(),
    });
  }

  Future<void> endCall(String callerId) async {
    await _firestore.collection('calls').doc(callerId).delete();
  }
}
