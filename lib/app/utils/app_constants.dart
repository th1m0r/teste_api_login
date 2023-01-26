import 'package:intl/intl.dart';

class AppConstants {
  AppConstants._();

  static const String urlApi = 'urlApi';

  static String dataFormatada(DateTime data) => DateFormat("dd/MM/yyyy").format(data);

  static String dataParaApi(DateTime data) => DateFormat("yyyy-MM-dd").format(data);

  static String formatarValor(double valor) =>
      NumberFormat.decimalPatternDigits(locale: 'pt_BR', decimalDigits: 2).format(valor);

  static String formatarQuantidade(double valor) =>
      NumberFormat.decimalPatternDigits(locale: Intl.defaultLocale, decimalDigits: 3).format(valor);
}
