import 'package:flutter/material.dart';

class TextUzs extends Text{
  TextUzs(super.data);

  @override
  String get data => "${super.data} UZS";

  // @override
  // TextStyle get style => super.style!.copyWith(fontSize: 12);
}