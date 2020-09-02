import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:theming/Ui/home.dart';
import 'package:theming/cubit/theme_cubit.dart';
import 'package:theming/di.dart';
import 'package:theming/theme/theme_palatte.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  initDI();
  getIt<ThemeCubit>().fetchTheme();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ThemeCubit>(),
      child: BlocBuilder<ThemeCubit, ThemePalatte>(
        builder: (context, themePallet) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Home(),
            theme: ThemeData(scaffoldBackgroundColor: themePallet.background),
          );
        },
      ),
    );
  }
}
