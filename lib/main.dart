import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}
//https://docs.flutter.dev/development/ui/widgets/cupertino
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("en", ""),
        Locale("tr", "")
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  //çalışmalarımızı burada yürüteceğiz
  @override
  Widget build(BuildContext context) {
    var d = AppLocalizations.of(context);

    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print("Genişlik: $ekranGenisligi");
    print("Yükseklik: $ekranYuksekligi");

    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.car),
            label: 'My Opel',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_dash),
            label: 'Options',
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("My Opel", style: TextStyle(
            fontFamily: "DynaPuff", fontSize: ekranGenisligi / 19),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Combo Cargo", style: TextStyle(
              fontSize: 36, color: anaRenk, fontWeight: FontWeight.bold),),
          Text("Elegance XL", style: TextStyle(fontSize: 20, color: anaRenk),),
          Image.asset("resimler/opel_combo.jpg"),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(d!.aracSasiNo, style: TextStyle(fontSize: 22,
                        color: yaziRenk1,
                        fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text(d.aracSasiNoBilgi,
                      style: TextStyle(fontSize: 16, color: yaziRenk2),),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(d.kilometre, style: TextStyle(fontSize: 22,
                        color: yaziRenk1,
                        fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text(d.kilometreBilgi,
                      style: TextStyle(fontSize: 16, color: yaziRenk2),),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(d.yakitFiyati, style: TextStyle(fontSize: 22,
                        color: yaziRenk1,
                        fontWeight: FontWeight.bold),),
                    const Spacer(),
                    Text(d.yakitFiyatiBilgi,
                      style: TextStyle(fontSize: 16, color: yaziRenk2),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
