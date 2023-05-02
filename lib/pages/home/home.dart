import 'package:app_web_view2/pages/web_view/webView.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final String titulo = "Servicios Judiciales";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: titulo,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: titulo),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InterstitialAd? interstitial;

  @override
  void initState() {
    super.initState();

    iniciarInterstitialAd();
  }

  Future<void> iniciarInterstitialAd() async {
    try {
      await InterstitialAd.load(
          adUnitId: 'ca-app-pub-7342304270957396/3003542403',
          request: AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (InterstitialAd ad) {
              // Keep a reference to the ad so you can show it later.
              this.interstitial = ad;
            },
            onAdFailedToLoad: (LoadAdError error) {
              print('InterstitialAd failed to load: $error');
            },
          ));
    } catch (e) {}
  }

  void _showInterstitialAd() {
    if (interstitial == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    interstitial!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        iniciarInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        iniciarInterstitialAd();
      },
    );
    interstitial!.show();
    interstitial = null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    interstitial!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextButton(
            //   onPressed: () {
            //     String urlG =
            //         "http://consultas.funcionjudicial.gob.ec/informacionjudicial/public/informacion.jsf";
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ViewWeb(
            //           url: urlG,
            //         ),
            //       ),
            //     );
            //   },
            //   child: Text("Función Judiciales"),
            // ),
            TextButton(
              onPressed: () {
                String urlG =
                    "https://certificados.ministeriodelinterior.gob.ec/gestorcertificados/antecedentes/";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewWeb(
                      url: urlG,
                    ),
                  ),
                );
              },
              child: Text("Antecedente Penales"),
            ),
            TextButton(
              onPressed: () {
                String urlG =
                    "https://srienlinea.sri.gob.ec/sri-en-linea/SriRucWeb/ConsultaRuc/Consultas/consultaRuc";
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewWeb(
                      url: urlG,
                    ),
                  ),
                );
              },
              child: Text("Consulta de RUC"),
            ),
            TextButton(
              onPressed: () async {
                _showInterstitialAd();
              },
              child: Text("view complet"),
            ),
            TextButton(
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PageExample(
                //       title: "",
                //     ),
                //   ),

                // );
              },
              child: Text("etc"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: botonAdmod(),
    );
  }
}

Widget botonAdmod() {
  late BannerAd myBanner = BannerAd(
    // adUnitId: 'ca-app-pub-7342304270957396/6185321084',
    adUnitId: 'ca-app-pub-7342304270957396/6185321084',
    size: AdSize.banner,
    request: AdRequest(),
    listener: BannerAdListener(),
  );

  myBanner.load();

  final AdWidget adwidget = AdWidget(ad: myBanner);
  return Container(
    child: adwidget,
    width: myBanner.size.width.toDouble(),
    height: myBanner.size.height.toDouble(),
  );
}
