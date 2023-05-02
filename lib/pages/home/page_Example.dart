// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// //import 'package:admob_flutter_example/extensions.dart'; // import the extension

// class PageExample extends StatefulWidget {
//   final String title;
//   const PageExample({
//     required this.title,
//   });

//   @override
//   State<PageExample> createState() => _PageExampleState();
// }

// class _PageExampleState extends State<PageExample> {
//   BannerAd? _anchoredAdaptiveAd;
//   bool _isLoaded = false;

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//     _loadAd();
//   }

//   Future<void> _loadAd() async {
//     // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
//     final AnchoredAdaptiveBannerAdSize? size =
//         await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
//             MediaQuery.of(context).size.width.truncate());

//     if (size == null) {
//       print('Unable to get height of anchored banner.');
//       return;
//     }

//     _anchoredAdaptiveAd = BannerAd(
//       // TODO: replace these test ad units with your own ad unit.
//       adUnitId: Platform.isAndroid
//           ? 'ca-app-pub-7342304270957396/6185321084'
//           : 'ca-app-pub-3940256099942544/2934735716',
//       size: size,
//       request: AdRequest(),
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           print('$ad loaded: ${ad.responseInfo}');
//           setState(() {
//             // When the ad is loaded, get the ad size and use it to set
//             // the height of the ad container.
//             _anchoredAdaptiveAd = ad as BannerAd;
//             _isLoaded = true;
//           });
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           print('Anchored adaptive banner failedToLoad: $error');
//           ad.dispose();
//         },
//       ),
//     );
//     return _anchoredAdaptiveAd!.load();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _anchoredAdaptiveAd?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Stack(
//           alignment: AlignmentDirectional.bottomCenter,
//           children: <Widget>[
//             ListView.separated(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 itemBuilder: (context, index) {
//                   return Text(
//                     'Placeholder text',
//                     style: TextStyle(fontSize: 24),
//                   );
//                 },
//                 separatorBuilder: (context, index) {
//                   return Container(height: 40);
//                 },
//                 itemCount: 20),
//             if (_anchoredAdaptiveAd != null && _isLoaded)
//               Container(
//                 color: Colors.green,
//                 width: _anchoredAdaptiveAd!.size.width.toDouble(),
//                 height: _anchoredAdaptiveAd!.size.height.toDouble(),
//                 child: AdWidget(ad: _anchoredAdaptiveAd!),
//               )
//           ],
//         ),
//       ), // Add this
//     );
//   }
// }
