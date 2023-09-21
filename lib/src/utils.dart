import 'package:flutter/material.dart';
import 'package:nepali_utils/nepali_utils.dart';

import 'l10n/month_year_picker_localizations.dart';

NepaliDateTime monthYearOnly(NepaliDateTime dateTime) {
  return NepaliDateTime(dateTime.year, dateTime.month);
}

bool debugCheckHasMonthYearPickerLocalizations(BuildContext context) {
  assert(() {
    final localizations = Localizations.of<MonthYearPickerLocalizations>(
      context,
      MonthYearPickerLocalizations,
    );

    if (localizations == null) {
      throw FlutterError.fromParts([
        ErrorSummary('No MonthYearPickerLocalizations found.'),
        ErrorDescription(
          '${context.widget.runtimeType} widgets require '
          'MonthYearPickerLocalizations to be provided by a Localizations '
          'widget ancestor.',
        ),
        ErrorDescription(
          'The month_year_picker library uses Localizations to generate '
          'messages, labels, and abbreviations.',
        ),
        ErrorHint(
          'To introduce a MonthYearPickerLocalizations, add a Localization '
          'widget with a MonthYearPickerLocalizations delegate.',
        ),
        ...context.describeMissingAncestor(
          expectedAncestorType: MonthYearPickerLocalizations,
        ),
      ]);
    }
    return true;
  }());
  return true;
}
