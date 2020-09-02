import 'package:get_it/get_it.dart';
import 'package:theming/cubit/theme_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDI() async {
  _themeRegister();
}

void _themeRegister() {
  getIt.registerLazySingleton(() => ThemeCubit());
}
