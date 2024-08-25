import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:water_team_develop/cubit.dart';
import 'package:water_team_develop/gloable.dart';
import 'package:water_team_develop/lang_cubit.dart';
import 'package:water_team_develop/layout.dart';
import 'package:water_team_develop/register.dart';
import 'package:water_team_develop/state.dart';
import 'package:water_team_develop/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  TextEditingController? ahmed;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<dataCubit, dataStates>(
      listener: (context, state) async {
        if (state is eroor) {
          CustomAwesomeDialog.show(context, response);
        } else if (state is success) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => layout()));
          CustomToast.show("تم تسجيل الدخول بنجاح");
        }
      },
      builder: (context, state) {
        var cubit = dataCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Log In",
                style: TextStyle(color: orangeColor),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: ChangeNotifierProvider(
            create: (_) => LoginScreenStateProvider(),
            child: OfflineBuilder(
              connectivityBuilder: (
                BuildContext context,
                ConnectivityResult connectivity,
                Widget child,
              ) {
                final bool connected = connectivity != ConnectivityResult.none;
                return connected
                    ? SingleChildScrollView(
                        child: Form(
                          key: _globalKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // const Padding(
                                //   padding: EdgeInsets.all(8.0),
                                //   child: CircleAvatar(
                                //     backgroundColor: Colors.white,
                                //     radius: 160,
                                //     backgroundImage:
                                //         AssetImage('images/logo.png'),
                                //   ),
                                // ),

// Text_form_Field(labelText: "PHONE", readonly: false,controller: )
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Text_form_Field(
                                      readonly: false,
                                      controller: emailController,
                                      labelText: "Email",
                                      iconData: Icons.email,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Consumer<LoginScreenStateProvider>(
                                        builder: (context, loginStateProvider,
                                            child) {
                                      return TextFormField(
                                        obscureText: !loginStateProvider
                                            .isPasswordVisible,
                                        controller: passwordController,
                                        onTap: () {},
                                        decoration: InputDecoration(
                                          labelText:
                                              context.watch<AppCubit>().state ==
                                                      'ar'
                                                  ? "كلمة السر"
                                                  : "Password",
                                          prefixIcon: Icon(
                                            Icons.key,
                                            color: orangeColor,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: darkBlueColor),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: darkBlueColor),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: darkBlueColor),
                                          ),
                                          labelStyle:
                                              TextStyle(color: darkBlueColor),
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              loginStateProvider
                                                  .togglePasswordVisibility();
                                            },
                                            child: Icon(
                                              loginStateProvider
                                                      .isPasswordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "This field cannot be empty";
                                          } else {
                                            return null;
                                          }
                                        },
                                      );
                                    }),
                                  ),
                                ),

                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Forget password ?",
                                    ),
                                  ),
                                ),
                                customButton(
                                  text: "Log In",
                                  onPressed: () async {
                                    {
                                      if (_globalKey.currentState!.validate()) {
                                        {
                                          // if (emailController.text
                                          //         .toLowerCase()
                                          //         .contains(("@yahoo.com")) ||
                                          //     emailController.text
                                          //         .toLowerCase()
                                          //         .contains(("@gmail.com"))) {

                                          await cubit.login(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                        }
                                      }
                                    }
                                  },
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't Have Any Account?",
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Register Now",
                                          style: TextStyle(color: orangeColor),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Register()));
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("You Are Offline"),
                        ],
                      );
              },
              child: Container(),
            ),
          ),
        );
      },
    );
  }
}

class LoginScreenStateProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
