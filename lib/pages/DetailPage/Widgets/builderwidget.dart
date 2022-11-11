import 'package:crypto_app/models/cryptomodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget upperpartdetail(CryptoCurrency currentcrypto) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Price Change (24th)',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
      ),
      Builder(builder: (context) {
        double priceChange = currentcrypto.priceChange24!;
        double priceChangePercent = currentcrypto.priceChangePercentage24!;
        if (priceChange < 0) {
          return Text(
            ' ${priceChangePercent.toStringAsFixed(2)}% ( ${priceChange.toStringAsFixed(4)})',
            style: TextStyle(color: Colors.red, fontSize: 22.sp),
          );
        } else {
          return Text(
            '+ ${priceChangePercent.toStringAsFixed(2)}% (+ ${priceChange.toStringAsFixed(4)})',
            style: TextStyle(color: Colors.green, fontSize: 22.sp),
          );
        }
      })
    ],
  );
}
