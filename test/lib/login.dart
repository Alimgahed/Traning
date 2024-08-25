import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:test/Register.dart';
import 'package:test/cubit.dart';
import 'package:test/state.dart';
import 'package:test/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // late TextEditingController emailController;
  // late TextEditingController passwordController;

  TextEditingController? ahmed;

  @override
  // void initState() {
  //   super.initState();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<dataCubit, dataStates>(
      listener: (context, state) async {
        // if (state is eroor) {
        //   CustomAwesomeDialog.show(context, erooor?.eroor);
        // } else if (state is success) {
        //   await dataCubit.get(context).getJobs();
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => const layout()));
        //   CustomToast.show("تم تسجيل الدخول بنجاح");
        // }
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
          body: OfflineBuilder(
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

                              Padding(
                                padding: EdgeInsets.all(5),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: Text_form_Field(
                                    readonly: false,
                                    // controller: emailController,
                                    labelText: "Email",
                                    iconData: Icons.email,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .9,
                                  child: Text_form_Field(
                                    readonly: false,
                                    // controller: passwordController,
                                    labelText: "Password",
                                    iconData: Icons.key,
                                  ),
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
                                  // if (emailController.text
                                  //         .toLowerCase()
                                  //         .contains(("@yahoo.com")) ||
                                  //     emailController.text
                                  //         .toLowerCase()
                                  //         .contains(("@gmail.com"))) {
                                  //   await cubit.login();
                                  // }
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
                                    GestureDetector(
                                      child: Text(
                                        "Register Now",
                                        style: TextStyle(color: orangeColor),
                                      ),
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Register()));
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
        );
      },
    );
  }
}
