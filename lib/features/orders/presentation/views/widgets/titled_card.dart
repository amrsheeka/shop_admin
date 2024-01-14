import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/utils/text_styles.dart';

class TitledCard extends StatelessWidget {
  final num number;
  final String title;
  final bool active;
  final Function()? onTap;
  const TitledCard({Key? key,
    required this.number,
    required this.title,
    this.active = false,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:   active?
      Container(
          height: 200,
          width: 200,
          decoration: Styles.mainBoxDecoration.copyWith(color: Styles.mainColor),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$number',style: TextStyles.header?.apply(color: Colors.white),),
              const SizedBox(height: 20,),
              Text(title,style: TextStyles.subHeader?.apply(color: Colors.white),),
            ],
          )
      )
          :Container(
          height: 200,
          width: 200,
          decoration: Styles.mainBoxDecoration,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$number',style: TextStyles.header?.apply(color: Styles.mainColor),),
              const SizedBox(height: 20,),
              Text(title,style: TextStyles.subHeader,),
            ],
          )
      ),
    );
  }
}

