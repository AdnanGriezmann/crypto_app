import 'package:crypto_app/models/cryptomodel.dart';
import 'package:crypto_app/pages/DetailPage/detailpage.dart';
import 'package:crypto_app/providers/marketprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({super.key, required this.currentCrypto});
  final CryptoCurrency currentCrypto;

  @override
  Widget build(BuildContext context) {
    MarketProvider marketprovider =
        Provider.of<MarketProvider>(context, listen: false);
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(
                      id: currentCrypto.id!,
                    )));
      },
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(currentCrypto.image!),
      ),
      title: Row(
        children: [
          Flexible(
              child: Text(
            currentCrypto.name!,
            overflow: TextOverflow.ellipsis,
          )),
          SizedBox(
            width: 4.w,
          ),
          (currentCrypto.isFavorite == false)
              ? GestureDetector(
                  onTap: (() {
                    marketprovider.addFavorite(currentCrypto);
                  }),
                  child: Icon(
                    CupertinoIcons.heart,
                    size: 16.sp,
                  ),
                )
              : GestureDetector(
                  onTap: (() {
                    marketprovider.removeFavorite(currentCrypto);
                  }),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    size: 16.sp,
                  ),
                )
        ],
      ),
      subtitle: Text(currentCrypto.symbol!.toUpperCase()),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '₹ ${currentCrypto.currentPrice!.toStringAsFixed(4)}',
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp),
          ),
          Builder(builder: (context) {
            double priceChange = currentCrypto.priceChange24!;
            double priceChangePercent = currentCrypto.priceChangePercentage24!;
            if (priceChange < 0) {
              return Text(
                ' ${priceChangePercent.toStringAsFixed(2)}% ( ${priceChange.toStringAsFixed(4)})',
                style: const TextStyle(color: Colors.red),
              );
            } else {
              return Text(
                '+ ${priceChangePercent.toStringAsFixed(2)}% (+ ${priceChange.toStringAsFixed(4)})',
                style: const TextStyle(color: Colors.green),
              );
            }
          })
        ],
      ),
    );
  }
}
