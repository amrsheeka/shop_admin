import '../../../../core/models/product_model.dart';

abstract class AddProductState{}
class InitialState extends AddProductState{}
class PickImageSuccessState extends AddProductState{}
class AddImageLoadingState extends AddProductState{}
class AddImageSuccessState extends AddProductState{}
class AddCategoryLoadingState extends AddProductState{}
class AddCategorySuccessState extends AddProductState{}
class UploadProductLoadingState extends AddProductState{}
class UploadProductSuccessState extends AddProductState{
  late ProductModel productModel;
  UploadProductSuccessState(this.productModel);
}
class ChangeCategoryState extends AddProductState{}
class FormResetState extends AddProductState{}