import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:theming/theme/theme_palatte.dart';

class ThemeCubit extends Cubit<ThemePalatte> {
  ThemeCubit() : super(ThemePalatte.lightThemePalatte);
  Future fetchTheme() async {
    var themebox = await Hive.openBox('themeBox');
    var theme = await themebox.get('theme');

    final themePallet = theme == false
        ? ThemePalatte.lightThemePalatte
        : ThemePalatte.darkThemePalatte;
    return emit(themePallet);
  }

  void switchTheme(bool themeType) async {
    final themePallet = themeType == false
        ? ThemePalatte.lightThemePalatte
        : ThemePalatte.darkThemePalatte;
    var themebox = await Hive.openBox('themeBox');
    await themebox.put("theme", themeType);
    return emit(themePallet);
  }
}
