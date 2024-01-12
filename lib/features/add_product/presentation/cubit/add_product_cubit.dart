import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/models/product_model.dart';
import 'package:shop_admin/core/networks/common_repos/categories_repo.dart';
import 'package:shop_admin/core/networks/common_repos/image_repo.dart';
import 'package:shop_admin/features/add_product/data/repos/add_product_repo.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';

import 'error_states.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(InitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);
  List<Uint8List?> imageFiles = [];
  List<FilePickerResult> pickerResults = [];
  Future<FilePickerResult?> pickImage() async {
    FilePickerResult? pickerResult;
    try {
      pickerResult = await ImageRepo.pickImage();
      if (pickerResult != null) {
        imageFiles.add(pickerResult.files.first.bytes);
        pickerResults.add(pickerResult);
        emit(PickImageSuccessState());
      } else {
        throw 'No image selected';
      }
      return pickerResult;
    } catch (error) {
      emit(AddImageErrorState('No image selected'));
      return null;
    }
  }

  Future<void> addCategory({required String name}) async {
    try {
      emit(AddCategoryLoadingState());
      await CategoriesRepo.addCategory(name: name);
      emit(AddCategorySuccessState());
    } catch (error) {
      emit(AddCategoryErrorState(
          'Failed to add categories, Check your network'));
    }
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required String details,
    required String type,
    required double price,
    required double oldPrice,
  }) async {
    emit(UploadProductLoadingState());
    try {
      List<String>? urls = await uploadImages(pickerResults);
      if (urls != null) {
        ProductModel productModel = ProductModel(
            name, description, details, type, price, oldPrice, urls);
        await uploadProduct(productModel);
        emit(UploadProductSuccessState(productModel));
      } else {
        emit(UploadProductErrorState('No images selected'));
      }
    } catch (error) {
      emit(UploadProductErrorState(error.toString()));
    }
  }

  String? selectedCategory;
  void changeCategory({required String name}) {
    selectedCategory = name;
    emit(ChangeCategoryState());
  }
  void resetImages(){
    imageFiles = [];
    pickerResults =[];
    selectedCategory = null;
    emit(FormResetState());
  }
}
