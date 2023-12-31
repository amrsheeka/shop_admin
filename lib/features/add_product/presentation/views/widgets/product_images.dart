
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_styles.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return BlocConsumer<AddProductCubit,AddProductState>(
        builder: (context, state) {
          AddProductCubit cubit = AddProductCubit.get(context);
          return Container(
            decoration: Styles.mainBoxDecoration,
            child: Padding(
              padding: Styles.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Images',
                    style: TextStyles.title,
                  ),
                  Expanded(
                    child: Container(
                      decoration: Styles.contentDecoration,
                      child: Row(
                        children: [
                          Expanded(
                            child: Scrollbar(
                              controller: scrollController,
                              child: ListView.separated(
                                controller: scrollController,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.only(top: 10.0,left: 10,bottom: 10.0),
                                  child: SizedBox(
                                    width: 100,
                                    child: ConditionalBuilder(
                                      condition: cubit.imageFiles[index]!=null,
                                      builder: (BuildContext context) =>Image.memory(cubit.imageFiles[index]!),
                                      fallback: (BuildContext context) =>const Placeholder(),
                                    ),
                                  ),
                                ),
                                separatorBuilder: (BuildContext context, int index) =>const SizedBox(width: 10,),
                                itemCount: cubit.imageFiles.length,
                              ),
                            ),
                          ),
                          Padding(
                            padding: Styles.subContentPadding,
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Styles.backgroundColor)
                              ),
                              child: InkWell(
                                onTap: (){
                                  cubit.pickImage();
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(IconBroken.Plus,color: Styles.mainColor,),
                                    Text('Add Image',style: TextStyle(color: Styles.mainColor),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {

        },
    );
  }
}
