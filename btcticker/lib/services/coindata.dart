import 'package:btcticker/services/networkasset.dart';

const List<String> currenciesList = [
  'USD',
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const String kCryptoCompareAPIKey = '72bf2e2863ba479841c3d2610ffec6e9c3e72cf88ee583979b9fd8cf51817386';
const String kCryptoCompareURL = 'https://min-api.cryptocompare.com/data/price';

class CoinData {

  Future getCoinExchangeRate (String coin, String currency) async {
    NetworkAsset url = NetworkAsset();
    Map data;

    data = await url.getData('$kCryptoCompareURL?fsym=$coin&tsyms=$currency&api_key=$kCryptoCompareAPIKey');
    //print(data);
    return data['$currency'].toStringAsFixed(0);
  }

}