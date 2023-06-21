import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_mvvm/models/mocks/currencies_model.dart';

class CurrencyService {
  // for api
  static Future<List<CurrencyModel>> getCurrencies() async {
    const String baseUrl = "https://nbu.uz/uz";
    try {
      Response res = await Dio().get("$baseUrl/exchange-rates/json/");
      switch (res.statusCode) {
        case HttpStatus.ok:
          if (res.data is List) {
            return (res.data as List).map((e) {
              //currencies.add(CurrencyModel.fromJson(e)); listi doldurmak ucin
              return CurrencyModel.fromJson(e);
            }).toList();
          }
          return [].cast<CurrencyModel>();
        default:
          return [].cast<CurrencyModel>();
      }
    } catch (e) {
      if (e is DioError) {
        print("Error: ${e.response!.data}");
      }
    }
    throw Exception("Error while getting datas from API");
  }
}
