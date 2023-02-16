// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class PopularJobs extends StatelessWidget {
  final String image, text, title, price, location;
  const PopularJobs(
      {super.key,
      required this.image,
      required this.text,
      required this.title,
      required this.price,
      required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 17),
        width: 327.w,
        height: 74.h,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              25.horizontalSpace,
              Image.network(
                image,
                height: 45,
                width: 45,
              ),
              16.horizontalSpace,
              Column(
                children: [
                  Text(
                    text,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  4.verticalSpace,
                  Text(
                    title,
                    style: Style.textStyleRegular(
                      size: 13,
                      textColor: Style.greyColor90,
                    ),
                  )
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 17),
                child: Column(
                  children: [
                    Text(
                      price,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    4.verticalSpace,
                    Text(
                      location,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Style.textStyleRegular(
                        size: 13,
                        textColor: Style.greyColor90,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
