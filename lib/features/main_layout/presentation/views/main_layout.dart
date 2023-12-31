
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/main_layout/presentation/cubit/main_layout_cubit.dart';
import 'package:shop_admin/features/main_layout/presentation/cubit/states.dart';
import 'package:shop_admin/features/main_layout/presentation/views/widgets/side_bar.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>MainLayoutCubit()..getCategories(),
      child: BlocConsumer<MainLayoutCubit,MainLayoutState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          MainLayoutCubit cubit = MainLayoutCubit.get(context);
          return Scaffold(
            body: Row(
              children: <Widget>[
                sideBar(context: context,cubit: cubit),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(child: cubit.screens[cubit.currentIndex]),
              ],
            ),
          );
        },
      ),
    );
  }
}

