
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/default_form_field.dart';

class Price extends StatelessWidget {
  final TextEditingController price;
  final TextEditingController oldPrice;
  const Price({Key? key, required this.price, required this.oldPrice}) : super(key: key);

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
              'Price',
              style: TextStyles.title,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: Styles.contentDecoration,
                child: Padding(
                  padding: Styles.subContentPadding,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product Price',style: TextStyles.subtitle,),
                            defaultFormField(
                                label: 'Enter the product price',
                                controller: price,
                                prefixIcon: const Icon(Icons.price_check),
                                digital:true
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10,),
                      const VerticalDivider(thickness: 1, width: 1),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product Old Price',style: TextStyles.subtitle,),
                            defaultFormField(
                                label: 'Enter the product old price',
                                controller: oldPrice,
                                prefixIcon: const Icon(Icons.price_change),
                                keyboardType: TextInputType.number,
                                digital:true
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
