
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/networks/common_repos/categories_repo.dart';
import 'package:shop_admin/core/utils/constants.dart';
import '../../../add_product/presentation/views/add_product_screen.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../../../orders/presentation/views/orders_screen.dart';
import 'states.dart';

class MainLayoutCubit extends Cubit<MainLayoutState>{
  MainLayoutCubit():super(InitialState());
  static MainLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  List<Widget> screens = [const HomeScreen(), const AddProductScreen(), const OrdersScreen()];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

  Future<void> getCategories()async{
    emit(GetCategoriesLoadingState());
    try{
      Constants.categories = await CategoriesRepo.getCategories();
      print(Constants.categories);
      emit(GetCategoriesSuccessState());
    }catch(error){
      print(error);
      emit(GetCategoriesErrorState('Failed to get categories, Check your network'));
    }
  }

}