
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  bool validate = true;
  var formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController oldPrice = TextEditingController();
  late AddProductCubit cubit;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context)=>AddProductCubit(),
      child: BlocConsumer<AddProductCubit,AddProductState>(
        builder: (context, state) {
          cubit = AddProductCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: Styles.mainPadding,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text('Add Product',style: TextStyles.header,)),
                        ConditionalBuilder(
                            condition: state is !UploadProductLoadingState,
                            builder: (context) => defaultButton(
                              onPressed: (){
                                setState(() {
                                  if(!formKey.currentState!.validate()){
                                    validate=false;
                                  }
                                });
                                if(formKey.currentState!.validate()
                                    && cubit.selectedCategory!=null
                                    && cubit.pickerResults.isNotEmpty){
                                  cubit.addProduct(
                                      name: name.text,
                                      description: description.text,
                                      details: details.text,
                                      type: cubit.selectedCategory.toString(),
                                      price: double.parse(price.text),
                                      oldPrice: double.parse(price.text)
                                  );
                                }
                              },
                              text: 'Add',
                              icon:  Icon(Icons.save,color: Styles.iconsColor,),
                            ),
                            fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                    Text('Add your product for your customers',style: TextStyles.subHeader,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: validate?
                        (width>Constants.tabletWidth?730:1220)
                            :(width>Constants.tabletWidth?820:1430),

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
                              height: 235,
                                child: Price(price: price, oldPrice: oldPrice,)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if(state is AddProductErrorState){
            showToast(message: state.message, type: ToastType.WARNING);
          }else if(state is UploadProductSuccessState){
            showToast(message: 'Product ${state.productModel.name} added successfully', type: ToastType.SUCCESS);
             setState(() {
               name = TextEditingController();
               description = TextEditingController();
               details = TextEditingController();
               categoryName = TextEditingController();
               price = TextEditingController();
               oldPrice = TextEditingController();
             });
            cubit.resetImages();
          }
        },
      ),
    );
  }
}
