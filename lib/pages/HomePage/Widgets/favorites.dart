import 'package:crypto_app/Widget/cryptolist.dart';
import 'package:crypto_app/models/cryptomodel.dart';
import 'package:crypto_app/providers/marketprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(
      builder: (context, marketProvider, child) {
        List<CryptoCurrency> favorites = marketProvider.markets
            .where((element) => element.isFavorite == true)
            .toList();

        if (favorites.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await marketProvider.fetchData();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                CryptoCurrency currentCrypto = favorites[index];
                return CryptoList(currentCrypto: currentCrypto);
              },
            ),
          );
        } else {
          return Center(
            child: Text(
              "No favorites yet",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.sp,
              ),
            ),
          );
        }
      },
    );
  }
}
