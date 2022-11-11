import 'package:crypto_app/pages/HomePage/Widgets/Favorites.dart';
import 'package:crypto_app/pages/HomePage/Widgets/Markets.dart';
import 'package:crypto_app/providers/adprovder.dart';

import 'package:crypto_app/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController viewcontrolller;
  @override
  void initState() {
    super.initState();
    viewcontrolller = TabController(length: 2, vsync: this);
    AdProvider adProvider = Provider.of<AdProvider>(context, listen: false);
    adProvider.initHomePageBanner();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
          child: Container(
            padding:
                EdgeInsets.only(top: 12.h, left: 12.h, right: 12.h, bottom: 0),
            child: upperPart(themeProvider, context),
          ),
        ),
        bottomNavigationBar: Consumer<AdProvider>(
          builder: ((context, adprovider, child) {
            if (adprovider.isHomePagebannerloaded) {
              return SizedBox(
                height: adprovider.homePageBanner.size.height.toDouble(),
                child: AdWidget(ad: adprovider.homePageBanner),
              );
            } else {
              return Container(
                height: 0,
              );
            }
          }),
        ));
  }

  Widget upperPart(ThemeProvider themeProvider, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Crypto Today',
              style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {
                themeProvider.toggleTheme();
              },
              padding: const EdgeInsets.all(0),
              icon: themeProvider.themeMode == ThemeMode.light
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                color: const Color.fromARGB(255, 69, 173, 13)),
            controller: viewcontrolller,
            tabs: [
              Tab(
                child: Text(
                  'Markets',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Tab(
                child: Text(
                  'Favorites',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ]),
        Expanded(
          child: TabBarView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              controller: viewcontrolller,
              children: const [
                Markets(),
                Favorites(),
              ]),
        )
      ],
    );
  }
}
