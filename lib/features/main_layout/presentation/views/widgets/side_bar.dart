import 'package:flutter/material.dart';
import 'package:shop_admin/core/utils/constants.dart';
import 'package:shop_admin/features/main_layout/presentation/cubit/main_layout_cubit.dart';

Widget sideBar({required MainLayoutCubit cubit,required BuildContext context}){
  double width = MediaQuery.of(context).size.width;
  return NavigationRail(
    selectedIndex: cubit.currentIndex,
    extended: width>Constants.foldWidth,
    onDestinationSelected: (int index) {
      cubit.changeIndex(index);
    },

    destinations:  <NavigationRailDestination>[
      NavigationRailDestination(
        icon: Icon(Icons.home_filled,color: Colors.deepPurple.shade100,),
        selectedIcon: const Icon(Icons.home_filled),
        label: const Text('Home'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.add,color: Colors.deepPurple.shade100,),
        selectedIcon: const Icon(Icons.add),
        label: const Text('Add Product'),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.shopping_cart,color: Colors.deepPurple.shade100,),
        selectedIcon: const Icon(Icons.shopping_cart),
        label: const Text('Orders'),
      ),
    ],
  );
}