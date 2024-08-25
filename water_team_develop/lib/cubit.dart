import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:water_team_develop/exam.dart';
import 'package:water_team_develop/gloable.dart';
import 'package:water_team_develop/home.dart';
import 'package:water_team_develop/model.dart';
import 'package:water_team_develop/state.dart';

class dataCubit extends Cubit<dataStates> {
  static dataCubit get(context) => BlocProvider.of(context);

  dataCubit() : super(initail());
  int crrentindex = 0;
  void change(int index) {
    crrentindex = index;
    emit(botoom());
  }

  List<Widget> screens = [
    home(),
    Exam(),
  ];

  Future<void> login({required String email, required String password}) async {
    emit(loading());

    try {
      final res = await http
          .post(Uri.parse("http://196.205.81.66:3000/login"), headers: {
        "lang": "EN"
      }, body: {
        "email": email,
        "password": password,
      }).then((value) {
        if (value.statusCode == 200) {
          emit(success());
          response = value.body;
          print(value.body);
        } else if (value.statusCode == 400) {
          response = value.body;
          print(value.body);
          emit(eroor());
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> register({
    required String email,
  }) async {
    try {
      emit(loading_register());

      final res = await http.post(
        Uri.parse("http://172.16.90.123:3000/register"),
        headers: {"lang": "AR"},
        body: {"email": email},
      );

      if (res.statusCode == 200) {
        emit(success_register());
        // print(res.headers); // Corrected print statement
        Map<String, dynamic> jsonResponse =
            jsonDecode(res.body); // Parse the JSON string
        VCode vCode = VCode.fromJson(jsonResponse);
        print(vCode.vCode);
        V_Cooode = vCode.vCode;
        // print(res.body);
      } else if (res.statusCode == 400) {
        response = res.body;
        emit(eroor_Register()); // Corrected typo in the emit function
      }
    } catch (e) {
      response = e.toString();
      emit(eroor_Register()); // Corrected typo in the emit function
    }
  }

  Future<void> register_code({
    required String age,
    required String name,
    required String phone,
    required int stdying_yaer,
    required String password,
    required String email,
  }) async {
    try {
      emit(LOOADING_ACTIVE());

      final res = await http.post(
        Uri.parse("http://172.16.90.123:3000/register"),
        headers: {"lang": "AR"},
        body: {
          "Active": "true",
          "name": name,
          "phone": phone,
          "age": age,
          "email": email,
          "password": password,
          "studying_year": stdying_yaer.toString(),
        },
      );

      if (res.statusCode == 200) {
        emit(success_ACTIVE());

        print(res.body);
      } else if (res.statusCode == 400) {
        emit(EROOR_ACTIVE()); // Corrected typo in the emit function
      }
    } catch (e) {
      response = e.toString();
      print(e.toString());
      emit(EROOR_ACTIVE()); // Corrected typo in the emit function
    }
  }
}
