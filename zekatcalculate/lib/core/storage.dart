import 'package:shared_preferences/shared_preferences.dart';

class StorageBoarding {
  Future<bool> isFirstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    if (runned == null) {
      return true;
    }
    return false;
  }

  firstLauched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    await storage.setBool("runned", true);
  }

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    storage.clear();
  }
}






class StorageZakat {
  Future<List<String>> getZakatNames() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList('zakatNames') ?? [];
  }

  Future<List<double>> getAmounts() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList('amounts')?.map((e) => double.parse(e)).toList() ?? [];
  }

  Future<List<double>> getExchangeRates() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList('exchangeRates')?.map((e) => double.parse(e)).toList() ?? [];
  }

  Future<List<String>> getDates() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return storage.getStringList('dates') ?? [];
  }

  Future<void> saveZakat(String name, double amount, double exchangeRate, String date) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    List<String> zakatNames = storage.getStringList('zakatNames') ?? [];
    List<String> amounts = storage.getStringList('amounts') ?? [];
    List<String> exchangeRates = storage.getStringList('exchangeRates') ?? [];
    List<String> dates = storage.getStringList('dates') ?? [];

    zakatNames.add(name);
    amounts.add(amount.toString());
    exchangeRates.add(exchangeRate.toString());
    dates.add(date);

    await storage.setStringList('zakatNames', zakatNames);
    await storage.setStringList('amounts', amounts);
    await storage.setStringList('exchangeRates', exchangeRates);
    await storage.setStringList('dates', dates);
  }

  Future<void> clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }

  Future<void> saveData(List<String> savedZakatNames, List<double> savedAmounts, List<double> savedExchangeRates, List<String> savedDates) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setStringList('zakatNames', savedZakatNames);
    await storage.setStringList('amounts', savedAmounts.map((e) => e.toString()).toList());
    await storage.setStringList('exchangeRates', savedExchangeRates.map((e) => e.toString()).toList());
    await storage.setStringList('dates', savedDates);
  }

  Future<List<dynamic>> loadData() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final List<String>? zakatNames = storage.getStringList('zakatNames');
    final List<String>? amountsStrings = storage.getStringList('amounts');
    final List<String>? exchangeRateStrings = storage.getStringList('exchangeRates');
    final List<String>? dates = storage.getStringList('dates');

    if (zakatNames == null || amountsStrings == null || exchangeRateStrings == null || dates == null) {
      return [];
    }

    final List<double> amounts = amountsStrings.map((e) => double.parse(e)).toList();
    final List<double> exchangeRates = exchangeRateStrings.map((e) => double.parse(e)).toList();

    return [zakatNames, amounts, exchangeRates, dates];
  }
}
