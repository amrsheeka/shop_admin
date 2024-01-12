import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';
abstract class AddProductErrorState extends AddProductState{
  String message;
  AddProductErrorState(this.message);
}
class AddImageErrorState extends AddProductErrorState{
  AddImageErrorState(super.message);
}
class AddCategoryErrorState extends AddProductErrorState{
  AddCategoryErrorState(super.message);
}
class UploadProductErrorState extends AddProductErrorState{
  UploadProductErrorState(super.message);
}