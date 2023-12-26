
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';


class AddProductCubit extends Cubit<AddProductState>{
  AddProductCubit():super(InitialState());
  static AddProductCubit get(context) => BlocProvider.of(context);

}