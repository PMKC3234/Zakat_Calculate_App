// ignore_for_file: use_build_context_synchronously, prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../core/localizations.dart';
import '../core/storage.dart'; // Storage sınıfını içeren dosya

class ZakatEntryForm extends StatefulWidget {
  @override
  _ZakatEntryFormState createState() => _ZakatEntryFormState();
}

class _ZakatEntryFormState extends State<ZakatEntryForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _amountController;
  late TextEditingController _exchangeRateController;
  late TextEditingController _dateController;

  List<String> savedZakatNames = [];
  List<double> savedAmounts = [];
  List<double> savedExchangeRates = [];
  List<String> savedDates = [];

  // Storage sınıfından örnek oluşturma
  final StorageZakat storage = StorageZakat();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _amountController = TextEditingController();
    _exchangeRateController = TextEditingController();
    _dateController = TextEditingController();

    // Kaydedilmiş verileri yükle
    _loadSavedData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _exchangeRateController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .getTranslate("zakat_name"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 12),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)
                            .getTranslate("zakat_empty");
                      }
                      return null;
                    },
                  ),
                  Gap(8),
                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .getTranslate("zakat_amount"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 12),
                    validator: (value) {
                      if (value == null || double.tryParse(value) == null) {
                        return AppLocalizations.of(context)
                            .getTranslate("enter_valid_amount");
                      }
                      return null;
                    },
                  ),
                  Gap(8),
                  TextFormField(
                    controller: _exchangeRateController,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)
                          .getTranslate("exchange_rate"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 12),
                    validator: (value) {
                      if (value == null || double.tryParse(value) == null) {
                        return AppLocalizations.of(context)
                            .getTranslate("enter_valid_exchange");
                      }
                      return null;
                    },
                  ),
                  Gap(8),
                  TextFormField(
                    controller: _dateController,
                    onTap: () {
                      _selectDateTime(context);
                    },
                    decoration: InputDecoration(
                      labelText:
                          AppLocalizations.of(context).getTranslate("date"),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    style: TextStyle(fontSize: 12),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)
                            .getTranslate("date_empty");
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final zakatName = _nameController.text;
                              final amount =
                                  double.parse(_amountController.text);
                              final exchangeRate =
                                  double.parse(_exchangeRateController.text);
                              final date = _dateController.text;

                              setState(() {
                                savedZakatNames.add(zakatName);
                                savedAmounts.add(amount);
                                savedExchangeRates.add(exchangeRate);
                                savedDates.add(date);
                              });

                              _saveData(); // Verileri kaydet

                              _formKey.currentState!.reset();
                              _nameController.clear();
                              _amountController.clear();
                              _exchangeRateController.clear();
                              _dateController.clear();
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)
                                .getTranslate("zakat_saved"),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(20),
            for (int i = 0; i < savedZakatNames.length; i++)
              Dismissible(
                key: UniqueKey(),
                onDismissed: (direction) {
                  if (direction == DismissDirection.endToStart) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(AppLocalizations.of(context)
                              .getTranslate("zakat_delete")),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  savedZakatNames.removeAt(i);
                                  savedAmounts.removeAt(i);
                                  savedExchangeRates.removeAt(i);
                                  savedDates.removeAt(i);
                                });
                                _saveData(); // Verileri kaydet
                                Navigator.of(context).pop('Evet');
                              },
                              child: Text('Evet'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // Herhangi bir değer döndürmeden dialogu kapatıyoruz
                              },
                              child: Text(AppLocalizations.of(context)
                                  .getTranslate("no")),
                            ),
                          ],
                        );
                      },
                    ).then((value) {
                      if (value ==
                          AppLocalizations.of(context).getTranslate("yes")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalizations.of(context)
                                .getTranslate("regestration_delete")),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  }
                },
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20.0),
                  color: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .getTranslate("saved_zakat_info"),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Gap(8),
                            Text(
                              '${AppLocalizations.of(context).getTranslate("zakat_name")}: ${savedZakatNames[i]}',
                            ),
                            Gap(8),
                            Text(
                              '${AppLocalizations.of(context).getTranslate("zakat_amount")}: ${savedAmounts[i].toString()}',
                            ),
                            Gap(8),
                            Text(
                              '${AppLocalizations.of(context).getTranslate("exchange_rate")}: ${savedExchangeRates[i].toString()}',
                            ),
                            Gap(8),
                            Text(
                              '${AppLocalizations.of(context).getTranslate("date")}: ${savedDates[i]}',
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(AppLocalizations.of(context)
                                    .getTranslate("zakat_delete")),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        savedZakatNames.removeAt(i);
                                        savedAmounts.removeAt(i);
                                        savedExchangeRates.removeAt(i);
                                        savedDates.removeAt(i);
                                      });
                                      _saveData(); // Verileri kaydet
                                      Navigator.of(context).pop(
                                          AppLocalizations.of(context)
                                              .getTranslate("yes"));
                                    },
                                    child: Text(AppLocalizations.of(context)
                                        .getTranslate("yes")),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(
                                          AppLocalizations.of(context)
                                              .getTranslate("no"));
                                    },
                                    child: Text(AppLocalizations.of(context)
                                        .getTranslate("no")),
                                  ),
                                ],
                              );
                            },
                          ).then((value) {
                            if (value ==
                                AppLocalizations.of(context)
                                    .getTranslate("yes")) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(AppLocalizations.of(context)
                                      .getTranslate("regestration_delete")),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          });
                        },
                        child: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        final pickedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          _dateController.text = pickedDateTime.toString();
        });
      }
    }
  }

  Future<void> _saveData() async {
    // Storage sınıfının saveData metodunu kullanarak verileri sakla
    await storage.saveData(
        savedZakatNames, savedAmounts, savedExchangeRates, savedDates);
  }

  Future<void> _loadSavedData() async {
    // Storage sınıfının loadData metodunu kullanarak verileri yükle
    final data = await storage.loadData();
    setState(() {
      savedZakatNames = data[0] ?? [];
      savedAmounts = data[1] ?? [];
      savedExchangeRates = data[2] ?? [];
      savedDates = data[3] ?? [];
    });
  }
}
