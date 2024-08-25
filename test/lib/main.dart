import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubit.dart';
import 'package:test/dio.dart';
import 'package:test/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

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
