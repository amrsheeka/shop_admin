
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/networks/common_repos/image_repo.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';


class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() :super(InitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);
  List<String> imageURLs = [];
  Future<void> uploadImage() async {
    FilePickerResult? pickerResult;
    try{
      pickerResult = await ImageRepo.pickImage();
    }catch(error){
      emit(AddImageErrorState('No image selected'));
    }

    if(pickerResult != null){
      try{
        emit(AddImageLoadingState());
        String? imageURL = await ImageRepo.uploadImage(pickerResult);
        imageURL!=null?imageURLs.add(imageURL):null;
        emit(AddImageSuccessState());
      }catch(error){
        emit(AddImageErrorState('Failed to upload, Check your network'));
      }
    }
  }

}
