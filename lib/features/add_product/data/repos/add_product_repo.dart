import 'package:file_picker/file_picker.dart';
import 'package:shop_admin/core/models/product_model.dart';
import 'package:shop_admin/core/utils/constants.dart';

import '../../../../core/networks/common_repos/image_repo.dart';

Future<void> uploadProduct(ProductModel productModel)async{
  var doc=  Constants.firebaseFirestore.collection('products').doc();
  productModel.id = doc.id;
  doc.set(productModel.toJson()).catchError((error){
    throw 'Failed to upload the product ${productModel.name}';
  });
}
Future<List<String>?> uploadImages(List<FilePickerResult?> pickerResults)async{
  if(pickerResults.isNotEmpty){
    List<String> imageURLs = [];
    try{
      for(FilePickerResult? pickerResult in pickerResults){
        String id = ImageRepo.generateId();
        String? imageURL = await ImageRepo.uploadImage(id,pickerResult!);
        imageURL!=null?imageURLs.add(imageURL):null;
      }
      return imageURLs;
    }catch(error){
      rethrow;
    }
  }
  return null;
}