import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';

class FeaturedJobs extends StatefulWidget {
  final int index;
  final String imageLogoCompany;
  final String textPosition;
  final String companyName;
  final String wrap1;
  final String wrap2;
  final String wrap3;
  final String salary;
  final String textlocation;

  const FeaturedJobs(
      {super.key,
      required this.index,
      required this.imageLogoCompany,
      required this.companyName,
      required this.textPosition,
      required this.wrap1,
      required this.wrap2,
      required this.wrap3,
      required this.salary,
      required this.textlocation});

  @override
  State<FeaturedJobs> createState() => _FeaturedJobsState();
}

class _FeaturedJobsState extends State<FeaturedJobs> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280.w,
        height: 186.h,
        margin: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/Group.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(24),
          color: Colors.primaries[widget.index % Colors.primaries.length],
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  24.horizontalSpace,
                  Container(
                    height: 46.h,
                    width: 46.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.imageLogoCompany),
                        ),
                        color: Style.whiteColor,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.textPosition,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Style.textStyleRegular2(
                                textColor: Style.whiteColor),
                          ),
                          Text(
                            widget.companyName,
                            style: Style.textStyleRegular2(
                                size: 14, textColor: Style.whiteColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 24, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Style.whiteColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(65)),
                          child: Text(
                            widget.wrap1,
                            style: Style.textStyleRegular2(
                                size: 12, textColor: Style.whiteColor),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Style.whiteColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(65)),
                          child: Text(
                            widget.wrap2,
                            style: Style.textStyleRegular2(
                                size: 12, textColor: Style.whiteColor),
                          ),
                        )
                      ],
                    ),
                    Wrap(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Style.whiteColor.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(65)),
                          child: Text(
                            widget.wrap3,
                            style: Style.textStyleRegular2(
                                size: 12, textColor: Style.whiteColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  1.horizontalSpace,
                  Text(
                    widget.salary,
                    style: Style.textStyleRegular2(
                        size: 13, textColor: Style.whiteColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      widget.textlocation,
                      style: Style.textStyleRegular2(
                          size: 13, textColor: Style.whiteColor),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
