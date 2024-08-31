import 'dart:io';
import 'package:intl/intl.dart';

String currencyFormatter(double amount, {int? decimalDigits}) {
  final formatCurrency = NumberFormat.simpleCurrency(
    locale: Platform.localeName,
    name: 'NGN',
    decimalDigits: decimalDigits ?? 2,
  );
  final formattedAmount = formatCurrency.format(amount);
  return formattedAmount;
}
