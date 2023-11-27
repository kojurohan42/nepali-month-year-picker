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
    return MaterialApp(
      title: 'Nepali Month Year Picker Example',
      home: const MyHomePage(),
      theme: ThemeData(useMaterial3: true),
      localizationsDelegates: const [
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
      appBar: AppBar(title: const Text('Nepali Month Year Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_selected == null)
              const Text('No month year selected.')
            else ...[
              CalendarIconButton(
                  onNext: onNextPressed,
                  onPrev: onPrevPressed,
                  onTap: () => _onPressed(context: context),
                  title: NepaliDateFormat(
                    'MMMM yyyy',
                  ).format(_selected!)),
              Text(NepaliDateFormat('MMMM yyyy', Language.nepali)
                  .format(_selected!)),
            ],
            TextButton(
              child: const Text('DEFAULT LOCALE'),
              onPressed: () => _onPressed(context: context),
            ),
            TextButton(
              child: const Text('नेपाली'),
              onPressed: () => _onPressed(
                context: context,
                locale: 'ne',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onNextPressed() {
    if (_selected!.month + 1 > 12) {
      _selected = NepaliDateTime(_selected!.year + 1, 1);
    } else {
      _selected = NepaliDateTime(_selected!.year, _selected!.month + 1);
    }
    setState(() {});
  }

  void onPrevPressed() {
    if (_selected!.month - 1 < 1) {
      _selected = NepaliDateTime(_selected!.year + 1, 12);
    } else {
      _selected = NepaliDateTime(_selected!.year, _selected!.month - 1);
    }
    setState(() {});
  }

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : const Locale("en");
    final selected = await showNepaliMonthYearPicker(
      context: context,
      initialDate: _selected ?? NepaliDateTime.now(),
      firstDate: NepaliDateTime(2070),
      lastDate: NepaliDateTime(2090),
      locale: localeObj,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
      });
    }
  }
}

class CalendarIconWidget extends StatelessWidget {
  const CalendarIconWidget({super.key, required this.icon, required this.func});
  final Widget icon;
  final VoidCallback func;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: icon,
      ),
    );
  }
}

class CalendarIconButton extends StatelessWidget {
  const CalendarIconButton(
      {super.key,
      required this.onNext,
      required this.onPrev,
      required this.onTap,
      required this.title});
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalendarIconWidget(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              func: onPrev,
            ),
            const Icon(
              Icons.calendar_month,
            ),
            Text(
              title,
            ),
            CalendarIconWidget(
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
              func: onNext,
            ),
          ],
        ),
      ),
    );
  }
}
