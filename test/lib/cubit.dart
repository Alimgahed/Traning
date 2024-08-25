import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:test/state.dart';

class dataCubit extends Cubit<dataStates> {
  static dataCubit get(context) => BlocProvider.of(context);

  dataCubit() : super(initail());
  Future<void> login() async {
    emit(loading());

    try {
      final res = await http.post(Uri.parse("http://172.16.90.112:3000/login"),
          body: {
            "name": "ali",
            "price": "500",
            "desc": "mobile"
          }).then((value) {
        if (value.statusCode == 200) {
          print(value.body);
        } else {}
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
