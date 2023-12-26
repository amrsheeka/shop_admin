
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_styles.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
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
                child: Scrollbar(
                  controller: scrollController,
                  child: ListView.separated(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Container(
                          color: Styles.backgroundColor,
                          width: 100,
                        ),
                      ),
                      separatorBuilder: (context, index) => const SizedBox(width: 10,),
                      itemCount: 100
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
