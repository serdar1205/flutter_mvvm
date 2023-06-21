import 'package:flutter/material.dart';
import 'package:flutter_mvvm/services/currency_services.dart';
import '../models/mocks/currencies_model.dart';

class CurrenciesProvider extends ChangeNotifier{
  List<CurrencyModel> currencies = [];
  bool isLoading = false;

  double totalSum =0;

  CurrenciesProvider(){
    getCurrencies();
  }

  void checkTotalSum(){
    for(var currency in currencies){
      totalSum += double.parse(currency.cbPrice).floor();
    }
    notifyListeners();
  }

  getCurrencies()async{
    changeLoading();
    CurrencyService.getCurrencies().then((value) {
      currencies = value;
      changeLoading();
    });
  }

  changeLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
}