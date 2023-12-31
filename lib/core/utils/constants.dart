import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Constants{
  static double tabletWidth = 800;
  static double foldWidth = 991;
  static FirebaseStorage firebaseStorage= FirebaseStorage.instance;
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static List<String> categories = [];
}