import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/orders/presentation/cubit/orders_cubit.dart';
import 'package:shop_admin/features/orders/presentation/views/widgets/titled_card.dart';
import '../../../../core/utils/constants.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => OrdersCubit(),
      child: BlocConsumer<OrdersCubit,OrdersState>(
        builder: (context, state) {
          OrdersCubit cubit = OrdersCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flex(
                direction: width>Constants.tabletWidth?Axis.horizontal:Axis.vertical,
                children: [
                  width>Constants.tabletWidth?const Spacer():const SizedBox(height: 20,),
                  TitledCard(
                    title: 'Waiting',
                    number: 15,
                    active: cubit.selectedView==0,
                    onTap: (){
                      cubit.changView(0);
                    },
                  ),
                  width>Constants.tabletWidth?const Spacer():const SizedBox(height: 20,),
                  TitledCard(
                    title: 'Active',
                    number: 15,
                    active: cubit.selectedView==1,
                    onTap: (){
                      cubit.changView(1);
                    },
                  ),
                  width>Constants.tabletWidth?const Spacer():const SizedBox(height: 20,),
                  TitledCard(
                    title: 'Finished',
                    number: 15,
                    active: cubit.selectedView==2,
                    onTap: (){
                      cubit.changView(2);
                    },
                  ),
                  width>Constants.tabletWidth?const Spacer():const SizedBox(height: 20,),
                ],
              ),
            ],
          );
        },
        listener: (context, state) {

        },
      ),
    );
  }
}
