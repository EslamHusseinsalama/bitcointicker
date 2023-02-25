import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bitcointicker/price_screen.dart';
const List<String> currenciesList = [
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

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'CB2DDE46-D32C-4791-92E0-27D094AAEBD3';


class CoinData {

  Future getCoinData(String selectedCurrency) async {
    


    String requestURL = '$coinAPIURL/BTC/$selectedCurrency?apikey=$apiKey';

    http.Response response = await http.get(Uri.parse(requestURL));


    if (response.statusCode == 200) {

      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['rate'];

      return lastPrice.toString();
    } else {

      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }
}