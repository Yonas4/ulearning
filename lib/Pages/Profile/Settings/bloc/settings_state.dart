import 'package:flutter/material.dart';

abstract class SettingsState {
  const SettingsState();
}

class InitialSettingState extends SettingsState {
  const InitialSettingState();
}

class ChangeLocaleSettingState extends SettingsState {
  final Locale locale;

  ChangeLocaleSettingState({
    required this.locale,
  });
}
