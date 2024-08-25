import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<String> {
  AppCubit() : super("en"); // Default language is English

  void toggleLanguage(String languageCode) {
    emit(languageCode);
  }
}
