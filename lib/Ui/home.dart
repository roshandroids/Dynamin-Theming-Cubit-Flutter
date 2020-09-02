import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theming/cubit/theme_cubit.dart';
import 'package:theming/di.dart';
import 'package:theming/theme/theme_palatte.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ThemeCubit>(),
        child: BlocBuilder<ThemeCubit, ThemePalatte>(
          builder: (context, themePallet) {
            return Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    color: themePallet.corePalatte.buttonColor,
                    onPressed: () {},
                    child: Text((!themePallet.themeType) ? "light" : "Dark"),
                  ),
                  Switch(
                    value: themePallet.themeType == false ? false : true,
                    onChanged: (status) {
                      getIt<ThemeCubit>().switchTheme(
                        status ? true : false,
                      );
                    },
                  ),
                ],
              )),
            );
          },
        ));
  }
}
