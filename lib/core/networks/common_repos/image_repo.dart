import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shop_admin/core/utils/constants.dart';

class ImageRepo{
  static Future<FilePickerResult?> pickImage() async {
    FilePickerResult? pickedImage;
    pickedImage = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    return pickedImage;
  }
  static Future<String?> uploadImage (pickedImage)async {

    try{
      Uint8List? uploadFile = pickedImage.files.single.bytes;
      DateTime date = DateTime.now();
      Reference ref = Constants.firebaseStorage.ref('/products')
          .child('${date.toString()}.${pickedImage.files.first.extension}');
      if(uploadFile!=null){
        final UploadTask uploadTask =ref.putData(uploadFile);
        uploadTask.whenComplete(() async {
          return await uploadTask.snapshot.ref.getDownloadURL();

        });
      }
    }catch(error){
      return null;
    }
    return null;

  }
}
