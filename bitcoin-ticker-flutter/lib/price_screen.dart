import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var _selectedCurrency = 'USD';
  var _loaded = false;
  Map<String, dynamic> _coinData = {};

  Widget getPicker() {
    if (Platform.isIOS) {
      return CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: 18),
        backgroundColor: Colors.lightBlue,
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          setState(() {
            _selectedCurrency = currencies[selectedIndex];
          });
        },
        children: currencies.map((currency) => Text(currency)).toList(),
      );
    } else {
      return DropdownButton<String>(
        value: _selectedCurrency,
        items: currencies.map((currency) {
          return DropdownMenuItem(
            child: Text(currency),
            value: currency,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedCurrency = value;
            // _currentVal = _coinData[_selectedCurrency];
          });
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    CoinData().getCoinData().then((result) {
      _coinData = result;
      setState(() {
        _loaded = true;
      });
    });
  }

  List<Widget> getCards() {
    List<Widget> cards = [];
    _coinData.forEach((k, v) {
      var symbol = _coinData[k]['symbol'];
      cards.add(buildCard(symbol, k));
    });

    return cards;
  }

  Widget buildCard(String symbol, String coinType) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $symbol = ${_coinData[coinType][_selectedCurrency.toLowerCase()]} $_selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _loaded
              ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: getCards(),
                  ),
                )
              : Padding(
                  child: CircularProgressIndicator(),
                  padding: EdgeInsets.only(top: 200),
                ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
