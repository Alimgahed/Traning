import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:water_team_develop/cubit.dart';
import 'package:water_team_develop/dio.dart';
import 'package:water_team_develop/lang_cubit.dart';
import 'package:water_team_develop/login.dart';
import 'package:water_team_develop/shared_prafreance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await Cache.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<dataCubit>(
          create: (context) => dataCubit(),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        // Other bloc providers
      ],
      child: MaterialApp(
        title: 'binna ',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
          ),
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
