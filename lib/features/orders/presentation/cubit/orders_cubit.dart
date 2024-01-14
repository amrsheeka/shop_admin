import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context)=>BlocProvider.of(context);
  int selectedView=0;
  void changView(int index){
    selectedView = index;
    emit(ChangeView());
  }
}
