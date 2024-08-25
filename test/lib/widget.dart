import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color orangeColor = Color(0xFFE7C498);
Color greyColor = Color.fromARGB(246, 246, 246, 246);
Color darkBlueColor = Colors.black;
Widget customButton({required String text, required Function() onPressed}) {
  return GestureDetector(
    onTap: () {
      onPressed();
    },
    child: Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 54,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [orangeColor, orangeColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(50),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 50,
            color: Color(0xffEEEEEE),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}

Widget drawer_item({
  required IconData iconData,
  required String text,
  required Function() onTap,
}) {
  return ListTile(
    leading: Icon(iconData), // Wrap iconData with Icon widget
    title: Text(
      text, // Use the provided text parameter
      style: const TextStyle(fontSize: 18),
    ),
    onTap: onTap,
  );
}

Widget Text_form_Field({
  TextEditingController? controller,
  required String labelText,
  Function()? onTap,
  Function(String)? changed,
  Function()? onEditingComplete,
  required bool readonly,
  IconData? iconData,
  String? Function(String?)? validator,
  bool allowOnlyDigits = false,
  bool useValidator = true,
}) {
  return TextFormField(
    controller: controller,
    onTap: onTap,
    maxLines: null,
    readOnly: readonly,
    keyboardType: allowOnlyDigits ? TextInputType.number : TextInputType.text,
    inputFormatters: allowOnlyDigits
        ? <TextInputFormatter>[
            FilteringTextInputFormatter.allow(
              RegExp('.'), // Allow digits and optional decimal point
            ),
          ]
        : null,
    style: TextStyle(fontSize: 18.0),
    decoration: InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(
        iconData,
        color: orangeColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: orangeColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: darkBlueColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: orangeColor,
        ),
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      fillColor: Colors.grey,
    ),
    validator: useValidator
        ? validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "لا يمكن أن يكون هذا الحقل فارغ ";
              } else {
                return null;
              }
            }
        : null,
    onChanged: changed,
    onEditingComplete: onEditingComplete,
  );
}

Widget DropdownFormField<T>({
  required List<DropdownMenuItem<T>> items,
  required void Function(T?) onChanged,
  T? initialValue, // Allow passing an initial value which can be null
  required String labelText,
  required String hintText,
  IconData? prefixIcon,
  IconData? dropdownIcon,
  Color? iconEnabledColor,
  String? Function(T?)? validator,
}) {
  return DropdownButtonFormField<T>(
    value: initialValue, // Use the initialValue in the DropdownButtonFormField
    items: items,
    onChanged: onChanged,
    icon: dropdownIcon != null ? Icon(dropdownIcon) : null,
    iconEnabledColor: iconEnabledColor,
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        prefixIconColor: orangeColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: darkBlueColor,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: darkBlueColor,
          ),
        ),
        focusColor: darkBlueColor,
        iconColor: darkBlueColor,
        labelText: labelText,
        hintText: hintText,
        fillColor: darkBlueColor),
    validator: validator ??
        (value) {
          if (value == null) {
            return 'This field cannot be empty';
          } else {
            return null;
          }
        },
  );
}

Widget imagePicker({
  required Function() onTap,
  required File? imageFile,
  double width = 100,
  double height = 100,
  Color iconColor = Colors.black,
  Color containerColor = Colors.white,
  BoxDecoration? decoration,
}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: Container(
      width: width,
      height: height,
      decoration: decoration ??
          BoxDecoration(
            border: Border.all(),
            color: containerColor,
          ),
      child: imageFile != null
          ? Image.file(
              imageFile,
              fit: BoxFit.cover,
            )
          : Icon(
              Icons.add,
              size: 30,
              color: iconColor,
            ),
    ),
  );
}

// class CustomAwesomeDialog {
//   static void show(BuildContext context, String? response) {
//     AwesomeDialog(
//       context: context,
//       headerAnimationLoop: false,
//       dialogType: DialogType.error,
//       animType: AnimType.bottomSlide,
//       title: 'Error',
//       desc: response,
//       btnCancelOnPress: () {},
//       btnOkOnPress: () {},
//     )..show();
//   }
// }

// class CustomToast {
//   static void show(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.green,
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );
//   }
// }

// Example usage

