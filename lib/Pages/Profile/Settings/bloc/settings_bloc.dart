import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ulearning/Pages/Profile/Settings/bloc/settings_event.dart';
import 'package:ulearning/Pages/Profile/Settings/bloc/settings_state.dart';

import '../localization/language_cache_helper.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const InitialSettingState()) {
    on<SettingsEvent>(_settingEvent);
  }

  FutureOr<void> _settingEvent(
      SettingsEvent event, Emitter<SettingsState> emit) {
    if (event is InitialSettingState) {
      emit(const InitialSettingState());
    }
    if (event is ChangeLocalSettingEvent) {
      emit(ChangeLocaleSettingState(locale: const Locale('en')));
    }
  }

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();

    emit(ChangeLocaleSettingState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLocaleSettingState(locale: Locale(languageCode)));
  }
}
