import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mvvm/core/custom_widget/custom_text.dart';
import 'package:flutter_mvvm/provider/currencies_provider.dart';
import 'cart_view_model.dart';
import 'package:provider/provider.dart';

class CartView extends CartViewModel{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextUzs("${context.watch<CurrenciesProvider>().totalSum}"),
      ),
    );
  }
}