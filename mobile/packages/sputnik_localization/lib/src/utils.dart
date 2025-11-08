import 'package:flutter/material.dart';
import 'package:sputnik_localization/l10n/generated/app_localizations.dart';

extension BuildContextLocalizationEx on BuildContext {
  AppLocalizations get tr => AppLocalizations.of(this);
}
