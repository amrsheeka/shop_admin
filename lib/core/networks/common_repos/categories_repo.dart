import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/constants.dart';

class CategoriesRepo{
  static Future<void> addCategory({required String name})async{
    await Constants.firebaseFirestore.collection('categories').add({'type':name});
    Constants.categories = await CategoriesRepo.getCategories();
  }
  static Future<List<String>> getCategories()async{
      List<String> categories = [];
      QuerySnapshot<Map<String, dynamic>> result =await Constants.firebaseFirestore.collection('categories').get();
      categories.addAll(result.docs
          .map((doc) => doc['type']));
      return categories;
  }
}