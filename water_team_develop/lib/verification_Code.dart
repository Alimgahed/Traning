import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_team_develop/cubit.dart';
import 'package:water_team_develop/gloable.dart';
import 'package:water_team_develop/layout.dart';
import 'package:water_team_develop/state.dart';
import 'package:water_team_develop/widget.dart';

class VerificationCodePage extends StatefulWidget {
  @override
  _VerificationCodePageState createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _submitCode() async {
    final code = _controllers.map((controller) => controller.text).join();
    // print(code);
    // print(V_Cooode);
    if (V_Cooode == int.parse(code)) {
      await dataCubit.get(context).register_code(
          age: Age!,
          name: Name!,
          phone: Phone!,
          stdying_yaer: Stdying_year!,
          password: Password!,
          email: Email!);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => layout()));
      CustomToast.show("تم تسجيل الحساب بنجاح");
    } else {
      CustomAwesomeDialog.show(context, "كود التحقق غير صحيح");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<dataCubit, dataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Enter Verification Code'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Please enter the 6-digit verification code sent to your E_mail.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return _buildCodeInputBox(index);
                  }),
                ),
                SizedBox(height: 24),
                ConditionalBuilder(
                  condition: state is! LOOADING_ACTIVE,
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: _submitCode,
                      child: Text('Submit'),
                    );
                  },
                  fallback: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCodeInputBox(int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              if (value.length == 1 && index < 5) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else if (value.length == 0 && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          ),
        ),
      ),
    );
  }
}
