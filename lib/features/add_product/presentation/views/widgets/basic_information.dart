
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/default_form_field.dart';

class BasicInformation extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController description;
  final TextEditingController details;
  const BasicInformation({super.key, required this.name,required this.description,required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.mainBoxDecoration,
      child: Padding(
        padding: Styles.contentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Information',
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
                      Text('Product Name',style: TextStyles.subtitle,),
                      defaultFormField(
                        label: 'Enter the product name',
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter a valid the product name';
                          }
                          return null;
                        },
                        controller: name,
                        prefixIcon: const Icon(Icons.title)
                      ),
                      const SizedBox(height: 10,),
                      Text('Description',style: TextStyles.subtitle,),
                      defaultFormField(
                          label: 'Enter the product description',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Enter a valid the product description';
                            }
                            return null;
                          },
                          controller: description,
                          prefixIcon: const Icon(Icons.description)
                      ),
                      const SizedBox(height: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Details',style: TextStyles.subtitle,),
                            defaultFormField(
                              label: 'Enter the product details',
                                validator: (value){
                                  if(value!.isEmpty){
                                    return 'Enter a valid the product details';
                                  }
                                  return null;
                                },
                              controller: details,
                              maxLines: 5
                            ),
                          ],
                        ),
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
  }
}
