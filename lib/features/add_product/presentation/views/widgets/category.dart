
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_admin/core/utils/constants.dart';
import 'package:shop_admin/core/widgets/default_form_field.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/add_product_cubit.dart';
import 'package:shop_admin/features/add_product/presentation/cubit/states.dart';
import '../../../../../core/utils/icon_broken.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_styles.dart';

class Category extends StatelessWidget {
  final TextEditingController categoryName;
  const Category({Key? key, required this.categoryName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    'Category',
                    style: TextStyles.title,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: Styles.contentDecoration,
                      child: Padding(
                        padding: Styles.subContentPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product Category',style: TextStyles.subtitle,),
                            DropdownButtonFormField<String>(
                                hint: const Center(
                                    child: Text(
                                      'Select your city',
                                      //style: TextStyle(color: Colors.white),
                                    )),
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.white,
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(color:
                                        Colors.white
                                        ),
                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    fillColor: Styles.backgroundColor,
                                    filled: true
                                ),
                                validator: (value) {
                                  if (value == null) {
                                    return 'Choose your current city';
                                  }
                                  return null;
                                },

                                dropdownColor: Colors.blueGrey[50],
                                isDense: true,
                                isExpanded: true,
                                icon: const Icon(IconBroken.Arrow___Down_2,color: Styles.mainColor,),
                                items: Constants.categories.map<DropdownMenuItem<String>>(
                                        (dynamic value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                            child: Text(
                                              value,
                                              style: const TextStyle(color: Styles.mainColor),
                                            )),
                                      );
                                    }).toList(),
                                value: cubit.selectedCategory,
                                onChanged: (value) {
                                  if (value != null) {
                                    cubit.changeCategory(name: value.toString());
                                  }
                                }),
                            const SizedBox(height: 10,),
                            Text('Add New Category',style: TextStyles.subtitle,),
                            Row(
                              children: [
                                Expanded(
                                  child: defaultFormField(
                                      label: 'Enter your new category',
                                      prefixIcon: const Icon(Icons.category_outlined),
                                      controller: categoryName,
                                    validator: (value) {
                                      if(value!.isEmpty){
                                        return 'Enter a valid category';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                IconButton(
                                    onPressed: (){},
                                    icon: const Icon(IconBroken.Plus,color: Styles.mainColor,),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  )
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
