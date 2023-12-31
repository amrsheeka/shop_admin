
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/utils/text_styles.dart';
import 'package:shop_admin/core/widgets/show_toast.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/error_states.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';
import 'package:shop_admin/features/add_product/presentation/views/widgets/basic_information.dart';
import 'package:shop_admin/features/add_product/presentation/views/widgets/category.dart';
import 'package:shop_admin/features/add_product/presentation/views/widgets/price.dart';
import 'package:shop_admin/features/add_product/presentation/views/widgets/product_images.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/default_button.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController name = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController details = TextEditingController();
    TextEditingController categoryName = TextEditingController();
    TextEditingController price = TextEditingController();
    TextEditingController oldPrice = TextEditingController();
    return BlocProvider(
      create: (BuildContext context)=>AddProductCubit(),
      child: BlocConsumer<AddProductCubit,AddProductState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: Styles.mainPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text('Add Product',style: TextStyles.header,)),
                      defaultButton(
                        onPressed: (){

                        },
                        text: 'Add',
                        icon:  Icon(Icons.save,color: Styles.iconsColor,),
                      ),
                    ],
                  ),
                  Text('Add your product for your customers',style: TextStyles.subHeader,),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: SizedBox(
                      height: width>Constants.tabletWidth?700:1200,
                      child: Column(
                        children: [
                          Expanded(
                            child: Flex(
                              direction: width>Constants.tabletWidth?Axis.horizontal:Axis.vertical,
                              children: [
                                Expanded(
                                  child: BasicInformation(
                                    name: name,
                                    description: description,
                                    details: details,
                                  ),
                                ),
                                const SizedBox(width: 10,height: 10,),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Expanded(
                                        flex:2,
                                        child: ProductImages(),
                                      ),
                                      const SizedBox(width: 10,height: 10,),
                                      Expanded(
                                        flex: 3,
                                        child: Category(categoryName: categoryName,),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                              child: Price(price: price, oldPrice: oldPrice,)
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
          if(state is AddProductErrorState){
            showToast(message: state.message, type: ToastType.ERROR);
          }
        },
      ),
    );
  }
}
