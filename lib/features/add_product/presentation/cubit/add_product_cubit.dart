
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/networks/common_repos/categories_repo.dart';
import 'package:shop_admin/core/networks/common_repos/image_repo.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';

import 'error_states.dart';


class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() :super(InitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);
  List<String> imageURLs = [];
  List<Uint8List?> imageFiles = [];
  Future<FilePickerResult?> pickImage() async {
    FilePickerResult? pickerResult;
    try{
      pickerResult = await ImageRepo.pickImage();
      pickerResult!=null?imageFiles.add(pickerResult.files.first.bytes):null;
      emit(PickImageSuccessState());
      return pickerResult;
    }catch(error){
      emit(AddImageErrorState('No image selected'));
      return null;
    }
  }
  Future<void> uploadImage(pickerResult)async{
    if(pickerResult != null){
      try{
        emit(AddImageLoadingState());
        String id = ImageRepo.generateId();
        String? imageURL = await ImageRepo.uploadImage(id,pickerResult);
        imageURL!=null?imageURLs.add(imageURL):null;
        emit(AddImageSuccessState());
      }catch(error){
        emit(AddImageErrorState('Failed to upload, Check your network'));
      }
    }
  }
  Future<void> addCategory({required String name})async{
    try{
      emit(AddCategoryLoadingState());
      await CategoriesRepo.addCategory(name: name);
      emit(AddCategorySuccessState());
    }catch(error){
      emit(AddCategoryErrorState('Failed to add categories, Check your network'));
    }
  }

  String? selectedCategory;
  void changeCategory({required String name}){
    selectedCategory = name;
    emit(ChangeCategoryState());
  }
}
