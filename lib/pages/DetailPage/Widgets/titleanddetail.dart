import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget titleandDetail(
    String titile, String detail, CrossAxisAlignment crossAxisAlignment) {
  return Column(
    crossAxisAlignment: crossAxisAlignment,
    children: [
      Text(
        titile,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      ),
      Text(
        detail,
        style: TextStyle(fontSize: 10.sp),
      ),
    ],
  );
}
