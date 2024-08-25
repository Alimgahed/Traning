import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_team_develop/cubit.dart';
import 'package:water_team_develop/gloable.dart';
import 'package:water_team_develop/lang_cubit.dart';
import 'package:water_team_develop/layout.dart';
import 'package:water_team_develop/state.dart';
import 'package:water_team_develop/verification_Code.dart';

import 'package:water_team_develop/widget.dart';

class Register extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassord = TextEditingController();
  TextEditingController dateController = TextEditingController();
  int? classrom;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => LoginScreenStateProvider(),
        child: Scaffold(
            appBar: AppBar(
              title: Text("Register"),
            ),
            body:
                BlocConsumer<dataCubit, dataStates>(listener: (context, state) {
              if (state is eroor_Register) {
                CustomAwesomeDialog.show(context, response);
              } else if (state is success_register) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationCodePage()));
                CustomToast.show("تم تسجيل الحساب بنجاح");
              }
            }, builder: (context, state) {
              return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                      child: Form(
                    key: _globalKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text_form_Field(
                              labelText: "Name",
                              iconData: Icons.person,
                              controller: name,
                              readonly: false),
                          SizedBox(
                            height: 10,
                          ),
                          Text_form_Field(
                            iconData: Icons.email,
                            controller: email,
                            labelText: "E-mail",
                            readonly: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text_form_Field(
                              controller: phone,
                              labelText: "Phone",
                              readonly: false,
                              iconData: Icons.phone),
                          SizedBox(
                            height: 10,
                          ),
                          Text_form_Field(
                              controller: dateController,
                              labelText: "Date of Birth",
                              readonly: false,
                              iconData: Icons.calendar_month,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2027),
                                ).then((value) => {
                                      // startDate = value;
                                      dateController.text =
                                          DateFormat("yyyy-MM-dd")
                                              .format(value!)
                                    });
                              }),
                          SizedBox(
                            height: 10,
                          ),
                          DropdownFormField(
                            items: [
                              context.watch<AppCubit>().state == 'ar'
                                  ? "الصف الاول الثانوي"
                                  : "First Grade Secondary",
                              context.watch<AppCubit>().state == 'ar'
                                  ? "الصف الثاني الثانوي"
                                  : "Second year of secondary",
                              context.watch<AppCubit>().state == 'ar'
                                  ? "الصف الثالث الثانوي"
                                  : "Third year of secondary",
                            ]
                                .asMap()
                                .entries
                                .map((entry) => DropdownMenuItem(
                                      child: Text("${entry.value}"),
                                      value: entry.key,
                                    ))
                                .toList(),
                            onChanged: (int? val) async {
                              if (val != null) {
                                classrom = val;
                                print(classrom);
                              }
                            },
                            labelText: context.watch<AppCubit>().state == 'ar'
                                ? "الصف الدراسي"
                                : "Classroom",
                            hintText: context.watch<AppCubit>().state == 'ar'
                                ? "الصف الدراسي"
                                : "Classroom",
                            prefixIcon: Icons.menu_book_sharp,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Consumer<LoginScreenStateProvider>(
                            builder: (context, loginState, child) {
                              return Container(
                                color: Colors.white,
                                child: SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    obscureText: !loginState.isPasswordVisible,
                                    controller: password,
                                    onTap: () {},
                                    onChanged: (value) {
                                      loginState.checkPasswordMatch(
                                          value, confirmpassord.text);
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          context.watch<AppCubit>().state ==
                                                  'ar'
                                              ? "كلمة السر"
                                              : "Password",
                                      prefixIcon: Icon(
                                        Icons.key,
                                        color: darkBlueColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                      labelStyle:
                                          TextStyle(color: darkBlueColor),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          loginState.togglePasswordVisibility();
                                        },
                                        child: Icon(
                                          loginState.isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                        minWidth: 30,
                                        minHeight: 30,
                                      ),
                                      suffix: Icon(
                                        loginState.isInputMatched
                                            ? Icons.check
                                            : Icons.close,
                                        color: loginState.isInputMatched
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 10),
                          Consumer<LoginScreenStateProvider>(
                            builder: (context, loginState, child) {
                              return Container(
                                color: Colors.white,
                                child: SizedBox(
                                  height: 60,
                                  child: TextFormField(
                                    obscureText: !loginState.isPasswordVisible,
                                    controller: confirmpassord,
                                    onTap: () {},
                                    onChanged: (value) {
                                      loginState.checkPasswordMatch(
                                          password.text, value);
                                    },
                                    decoration: InputDecoration(
                                      hintText:
                                          context.watch<AppCubit>().state ==
                                                  'ar'
                                              ? "تأكيد كلمة السر"
                                              : "Confirm Password",
                                      prefixIcon: Icon(
                                        Icons.key,
                                        color: darkBlueColor,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: darkBlueColor,
                                        ),
                                      ),
                                      labelStyle:
                                          TextStyle(color: darkBlueColor),
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          loginState.togglePasswordVisibility();
                                        },
                                        child: Icon(
                                          loginState.isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                      ),
                                      suffixIconConstraints: BoxConstraints(
                                        minWidth: 30,
                                        minHeight: 30,
                                      ),
                                      suffix: Icon(
                                        loginState.isInputMatched
                                            ? Icons.check
                                            : Icons.close,
                                        color: loginState.isInputMatched
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field cannot be empty";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ConditionalBuilder(
                              condition: state is! loading_register,
                              builder: (context) {
                                return customButton(
                                  text: "Confirm",
                                  onPressed: () {
                                    if (_globalKey.currentState!.validate()) {
                                      Name = name.text;
                                      Phone = phone.text;
                                      Age = dateController.text;
                                      Email = email.text;
                                      Password = password.text;
                                      Stdying_year = classrom!;
                                      dataCubit.get(context).register(
                                            email: email.text,
                                          );
                                    }
                                  },
                                );
                              },
                              fallback: (context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                        ]),
                  )));
            })));
  }
}

class LoginScreenStateProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  bool _isInputMatched = false;

  bool get isPasswordVisible => _isPasswordVisible;
  bool get isInputMatched => _isInputMatched;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void checkPasswordMatch(String password, String confirmPassword) {
    _isInputMatched = password == confirmPassword;
    notifyListeners();
  }
}
