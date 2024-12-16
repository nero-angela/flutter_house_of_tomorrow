import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_of_tomorrow/util/helper/intl_helper.dart';
import 'package:house_of_tomorrow/util/lang/generated/l10n.dart';

part 'lang_event.dart';

class LangService extends Bloc<LangServiceEvent, Locale> {
  LangService({
    Locale? locale,
  }) : super(locale ?? IntlHelper.en) {
    on<OnToggleLang>((event, emit) {
      emit(IntlHelper.isKo ? IntlHelper.en : IntlHelper.ko);
      S.load(state);
    });
  }
}
