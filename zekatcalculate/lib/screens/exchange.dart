// ignore_for_file: unnecessary_string_interpolations, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../core/localizations.dart';
import '../services/api.dart';
import '../widgets/myappbar.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({Key? key}) : super(key: key);

  @override
  _ExchangeScreenState createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  late Future<Map<String, dynamic>> _exchangeRateFuture;

  @override
  void initState() {
    super.initState();
    const  apiKey = 'edfcc6ea7069f697470742de'; // API anahtarınızı buraya ekleyin
    final exchangeRateAPI = ExchangeRateAPI(apiKey);
    _exchangeRateFuture = exchangeRateAPI.getExchangeRates();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: AppLocalizations.of(context).getTranslate("exchange")),
        body: FutureBuilder(
          future: _exchangeRateFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const  Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Veriler alınamadı.'),
              );
            } else {
              return DovizListesi(data: snapshot.data);
            }
          },
        ),
      ),
    );
  }
}

class DovizListesi extends StatelessWidget {
  final Map<String, dynamic>? data;

  const DovizListesi({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const  EdgeInsets.all(16.0),
      children: <Widget>[
        DovizKarti(kod: 'USD', ad: 'Dolar', fiyat: data?['USD']),
        DovizKarti(kod: 'EUR', ad: 'Euro', fiyat: data?['EUR']),
        DovizKarti(kod: 'GBP', ad: 'İngiliz Sterlini', fiyat: data?['GBP']),
        DovizKarti(kod: 'JPY', ad: 'Japon Yeni', fiyat: data?['JPY']),
      ],
    );
  }
}

class DovizKarti extends StatelessWidget {
  final String kod;
  final String ad;
  final double? fiyat;

  const DovizKarti({
    Key? key,
    required this.kod,
    required this.ad,
    required this.fiyat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('$ad ($kod)'),
        subtitle: Text('${fiyat?.toStringAsFixed(2) ?? "Veri Yok"}'),
      ),
    );
  }
}
