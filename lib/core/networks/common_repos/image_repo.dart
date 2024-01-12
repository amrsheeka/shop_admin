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
  static Future<String?> uploadImage (String id,FilePickerResult pickedImage)async {
    String? res;
    try{
      Uint8List? uploadFile = pickedImage.files.single.bytes;

      Reference ref = Constants.firebaseStorage.ref('/products')
          .child('$id.${pickedImage.files.first.extension}');
      if(uploadFile!=null){
        final UploadTask uploadTask = ref.putData(uploadFile);
        await uploadTask.whenComplete(() async{
          res =await uploadTask.snapshot.ref.getDownloadURL();
        });
      }
    }catch(error){
      throw 'Failed to upload the image ${pickedImage.files.single.name}';
    }
    return res;

  }
  static String generateId()=>DateTime.now().toString();
}
