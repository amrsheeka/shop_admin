
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../add_product/presentation/views/add_product_screen.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../../../orders/presentation/views/orders_screen.dart';
import 'main_layout_states.dart';

class MainLayoutCubit extends Cubit<MainLayoutState>{
  MainLayoutCubit():super(InitialState());
  static MainLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  List<Widget> screens = [const HomeScreen(), const AddProductScreen(), const OrdersScreen()];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeCurrentIndexState());
  }

}