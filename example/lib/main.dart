import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nepali_month_year_picker/nepali_month_year_picker.dart';

import 'package:nepali_utils/nepali_utils.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const ExampleApp({
    Key? key,
  }) : super(key: key);

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Month Year Picker Example',
      home: MyHomePage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ------------------------------- CONSTRUCTORS ------------------------------
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  // --------------------------------- METHODS ---------------------------------
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ---------------------------------- FIELDS ---------------------------------
  NepaliDateTime? _selected;

  // --------------------------------- METHODS ---------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Month Year Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selected == null)
              const Text('No month year selected.')
            else
              Text(
                  NepaliDateFormat('MMMM', Language.nepali).format(_selected!)),
            TextButton(
              child: const Text('DEFAULT LOCALE'),
              onPressed: () => _onPressed(context: context),
            ),
            TextButton(
              child: const Text('BAHASA MALAYSIA'),
              onPressed: () => _onPressed(context: context, locale: 'ms'),
            ),
            TextButton(
              child: const Text('اللغة العربية'),
              onPressed: () => _onPressed(context: context, locale: 'ar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showNepaliMonthYearPicker(
      context: context,
      initialDate: _selected ?? NepaliDateTime.now(),
      firstDate: NepaliDateTime(2019),
      lastDate: NepaliDateTime(2030),
      locale: localeObj,
    );
    // final selected = await showDatePicker(
    //   context: context,
    //   initialDate: _selected ?? NepaliDateTime.now(),
    //   firstDate: NepaliDateTime(2019),
    //   lastDate: NepaliDateTime(2022),
    //   locale: localeObj,
    // );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}
