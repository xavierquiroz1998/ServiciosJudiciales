//import 'package:admob_flutter/admob_flutter.dart';
//import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  // Admob.initialize();

  runApp(const MyApp());
}
