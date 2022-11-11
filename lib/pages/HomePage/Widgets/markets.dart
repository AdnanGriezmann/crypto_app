import 'package:crypto_app/Widget/cryptolist.dart';
import 'package:crypto_app/models/cryptomodel.dart';
import 'package:crypto_app/providers/marketprovider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Markets extends StatefulWidget {
  const Markets({super.key});

  @override
  State<Markets> createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(builder: (context, marketprovider, child) {
      if (marketprovider.isLoading == true) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        if (marketprovider.markets.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () async {
              await marketprovider.fetchData();
            },
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: marketprovider.markets.length,
              itemBuilder: (context, index) {
                CryptoCurrency currentCrypto = marketprovider.markets[index];
                return CryptoList(currentCrypto: currentCrypto);
              },
            ),
          );
        } else {
          const Text('not found');
        }
        return Container();
      }
    });
  }
}
