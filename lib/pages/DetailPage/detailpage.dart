import 'package:crypto_app/models/cryptomodel.dart';
import 'package:crypto_app/pages/DetailPage/Widgets/builderwidget.dart';
import 'package:crypto_app/pages/DetailPage/Widgets/titleanddetail.dart';
import 'package:crypto_app/providers/marketprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});
  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Consumer<MarketProvider>(
        builder: ((context, marketprovider, child) {
          CryptoCurrency currentcrypto =
              marketprovider.fETCHCRYPTObyID(widget.id);

          return RefreshIndicator(
            onRefresh: (() async {
              await marketprovider.fetchData();
            }),
            child: ListView(
              padding: EdgeInsets.all(4.h),
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(currentcrypto.image!),
                  ),
                  title: Text(
                    "${currentcrypto.name!}(${currentcrypto.symbol!.toUpperCase()})",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  subtitle: Text(
                    'usd ${currentcrypto.currentPrice.toString()}',
                    style: TextStyle(
                        fontSize: 21.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                upperpartdetail(currentcrypto),
                SizedBox(
                  height: 14.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleandDetail(
                        'Market Cap',
                        '#${currentcrypto.marketCap!.toStringAsFixed(4)}',
                        CrossAxisAlignment.start),
                    titleandDetail(
                        'Market Cap Rank',
                        '#${currentcrypto.marketCapRank!.toStringAsFixed(4)}',
                        CrossAxisAlignment.end)
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleandDetail(
                        'Low 24th',
                        '#${currentcrypto.low24!.toStringAsFixed(4)}',
                        CrossAxisAlignment.start),
                    titleandDetail(
                        'high 24th',
                        '#${currentcrypto.high24!.toStringAsFixed(4)}',
                        CrossAxisAlignment.end)
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleandDetail(
                        'Circulating Supply',
                        currentcrypto.circulatingSupply!.toInt().toString(),
                        CrossAxisAlignment.start),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    titleandDetail(
                        'All Time Low',
                        currentcrypto.atl!.toStringAsFixed(4),
                        CrossAxisAlignment.start),
                    titleandDetail(
                        'All Time High',
                        currentcrypto.ath!.toStringAsFixed(4),
                        CrossAxisAlignment.end),
                  ],
                ),
              ],
            ),
          );
        }),
      )),
    );
  }
}
