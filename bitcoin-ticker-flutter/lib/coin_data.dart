import 'package:http/http.dart' as http;
import 'dart:convert';

// const url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
const listUrl = 'https://api.coingecko.com/api/v3/coins/list';
const baseUrl = 'https://api.coingecko.com/api/v3/simple/price';

const currencies = [
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
  // 'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const cryptoList = ['bitcoin', 'ethereum', 'litecoin'];

class CoinData {
  Future<Map<String, dynamic>> getCoinData() async {
    // coinsList contains the symbols, such as BTC
    var response = await http.get(listUrl);
    final coinsList = jsonDecode(response.body);

    final urlCurrencies = 'vs_currencies=' + currencies.join(',');
    final urlCoinTypes = 'ids=' + cryptoList.join(',');
    final url = '$baseUrl?$urlCoinTypes&$urlCurrencies';

    response = await http.get(url);
    var coinData = jsonDecode(response.body);

    // Add symbol, such as BTC, to each coin type
    coinData.forEach((k, v) {
      for (var coin in coinsList) {
        if (k == coin['id']) {
          coinData[k]['symbol'] = coin['symbol'].toUpperCase();
        }
      }
    });

    return coinData;
  }
}
