# Material Nepali Month/Year Picker

[![Pub](https://img.shields.io/pub/v/nepali_month_year_picker?style=flat-square)][pub]
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/kojurohan42/nepali-month-year-picker/publish.yaml?label=publish&style=flat-square)

The Nepali month year picker inspired by the month year picker by `zulfahmi.dev`. It is a month year picker for the Nepali calendar using the help of `nepali_utils`.

## Quick Start

1. Open your `pubspec.yaml` file and add this entry:

    ```yaml
    nepali_month_year_picker: ^0.0.1+1
    ```

   OR just run `flutter pub add nepali_month_year_picker` using your preferred terminal app.

2. Then run `flutter pub get`.
3. Import this library into your code:

    ```dart
    import 'package:nepali_month_year_picker/nepali_month_year_picker.dart';
    ```
    Additionally, ensure your MaterialApp refers to the following `localizationsDelegates`:
    ```
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
    ```


4. Usage in code:

    ```dart
    final selected = await showNepaliMonthYearPicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2019),
      lastDate: NepaliDateTime(2023),
    );
    ```

## Parameters

| Parameter                      | Description                                                                                                                                                                                                                                                                      |
| ------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `context`                      | Must not be `null`. Will be passed to the internal `showDialog` function call.                                                                                                                                                                                                   |
| `initialDate`                  | Must not be `null` and must fall between the `firstDate` and `lastDate`. The `initialDate` will be truncated to its `year` and `month` components. When the month/year picker is first displayed, it will show the month/year of the `initialDate`, with `initialDate` selected. |
| `firstDate`                    | Must not be `null`. The `firstDate` will be truncated to its `year` and `month` components. This is the earliest allowable month/year.                                                                                                                                           |
| `lastDate`                     | Must not be `null`. The `lastDate` will be truncated to its `year` and `month` components. This is the latest allowable month/year.                                                                                                                                              |
| `selectableMonthYearPredicate` | Can be `null`. The function to provide full control over which month/year can be selected. If provided, only the month/year that the `selectableMonthYearPredicate` returns `true` for will be selectable.                                                                       |
| `locale`                       | Can be `null`. If provided, will be used to set the locale for the month/year picker. Otherwise, it defaults to the ambient locale provided by `Localizations`. Can only be set to `en` as default and `ne` for Nepali 
| `language`             | Can be `null`. If provided, will be used as per to use the nepali formatter of `nepali_utils` package. Can be set to `Language.english` or `Language.nepali`.                                                                                                                 |
| `useRootNavigator`             | Can be `null`. Will be passed to the internal `showDialog` function call.                                                                                                                                                                                                        |
| `routeSettings`                | Can be `null`. Will be passed to the internal `showDialog` function call.                                                                                                                                                                                                        |
| `textDirection`                | Can be `null`. If provided, will be used to set the text direction for the month/year picker. Otherwise, it defaults to the ambient locale provided by `Directionality`.                                                                                                         |
| `builder`                      | Can be `null`. This parameter can be used to wrap the dialog widget with a parent widget.                                                                                                                                                                                        |
| `initialMonthYearPickerMode`   | Must not be `null`. Can be used to have the year picker initially appear in the `MonthYearPickerMode.year` mode. It defaults to the `MonthYearPickerMode.month` mode.                                                                                                            |


## Example Demo

https://github.com/kojurohan42/nepali-month-year-picker/assets/60424631/e6d73d09-422a-4bb6-90f6-0c47a8af42c4




## Screenshots

| Mode                                                    | Screenshot                                   |
| ------------------------------------------------------- | -------------------------------------------- |
| MonthYear picker in portrait mode with default locale.  | ![](screenshots/portrait_default.jpeg)  |
| MonthYear picker in portrait mode with Nepali locale.   | ![](screenshots/portrait_ne.jpeg)   |
| MonthYear picker in Landscape mode .                    | ![](screenshots/landscape.jpeg)       |


## Building From Source

### Dependencies

1. Dart SDK version 3.0.0 or newer.
2. Flutter SDK version 3.10 or newer.

### Steps

1. Clone this git repo into your machine.
2. Run `.\gen_l10n.ps1` to re-generate the localised strings.

## Features and Bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/kojurohan42/nepali-month-year-picker/issues).

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/kojurohan42/nepali-month-year-picker/blob/master/LICENSE) file for details.

[pub]: https://pub.dartlang.org/packages/month_year_picker
[tracker]: https://github.com/zulfahmi93/dart_libpray/issues
[license]: LICENSE
