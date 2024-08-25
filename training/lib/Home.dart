import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:training/course.dart';
import 'package:training/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Training"),
      ),
      drawer: Drawer(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.person_add_alt,
                  color: Colors.blue,
                ),
                title: Text(
                  "أضافة متدرب",
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text_form_Field(
                                                    labelText: "اسم المتدرب",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الكود",
                                                    readonly: false,
                                                    iconData:
                                                        Icons.numbers_sharp),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الوظيفة",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText:
                                                        "الدورة التدريبية",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .menu_book_rounded),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "تاريخ الدورة",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .calendar_month_sharp),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الفرع",
                                                    readonly: false,
                                                    iconData: Icons.business),
                                                SizedBox(height: 10),
                                                customButton(
                                                    text: "اضافة",
                                                    onPressed: () {})
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "موظف",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text_form_Field(
                                                    labelText: "اسم المتدرب",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الوظيفة",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "المؤهل الدراسي",
                                                    readonly: false,
                                                    iconData: Icons.book),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText:
                                                        "الدورة التدريبية",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .menu_book_rounded),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "تاريخ الدورة",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .calendar_month_sharp),
                                                SizedBox(height: 10),
                                                SizedBox(height: 10),
                                                customButton(
                                                    text: "اضافة",
                                                    onPressed: () {})
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "خارجي",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.person_add_alt_1,
                  color: Colors.blue,
                ),
                title: Text(
                  "أضافة مدرب",
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text_form_Field(
                                                    labelText: "اسم المتدرب",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الكود",
                                                    readonly: false,
                                                    iconData:
                                                        Icons.numbers_sharp),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الوظيفة",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText:
                                                        "الدورة التدريبية",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .menu_book_rounded),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "تاريخ الدورة",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .calendar_month_sharp),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الفرع",
                                                    readonly: false,
                                                    iconData: Icons.business),
                                                SizedBox(height: 10),
                                                customButton(
                                                    text: "اضافة",
                                                    onPressed: () {})
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "موظف",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          content: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text_form_Field(
                                                    labelText: "اسم المتدرب",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "الوظيفة",
                                                    readonly: false,
                                                    iconData: Icons.person),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "المؤهل الدراسي",
                                                    readonly: false,
                                                    iconData: Icons.book),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText:
                                                        "الدورة التدريبية",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .menu_book_rounded),
                                                SizedBox(height: 10),
                                                Text_form_Field(
                                                    labelText: "تاريخ الدورة",
                                                    readonly: false,
                                                    iconData: Icons
                                                        .calendar_month_sharp),
                                                SizedBox(height: 20),
                                                customButton(
                                                    text: "اضافة",
                                                    onPressed: () {})
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    "خارجي",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.post_add_rounded,
                  color: Colors.blue,
                ),
                title: Text(
                  "أضافة دورة",
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text_form_Field(
                                  labelText: "اسم الدورة",
                                  readonly: false,
                                  iconData: Icons.person),
                              SizedBox(height: 10),
                              Text_form_Field(
                                  labelText: "تاريخ بداية الدورة",
                                  readonly: false,
                                  iconData: Icons.book),
                              SizedBox(height: 10),
                              Text_form_Field(
                                  labelText: "تاريخ انتهاء الدورة",
                                  readonly: false,
                                  iconData: Icons.calendar_month),
                              SizedBox(height: 10),
                              Text_form_Field(
                                  labelText: "اسم المدرب",
                                  readonly: false,
                                  iconData: Icons.person),
                              Text_form_Field(
                                  labelText: "التكلفة",
                                  readonly: false,
                                  iconData: Icons.attach_money_outlined),
                              SizedBox(height: 10),
                              customButton(text: "اضافة", onPressed: () {})
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                  leading: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "بحث",
                    style: const TextStyle(fontSize: 18),
                  ),
                  onTap: () {})
              // Add more list tiles for other drawer options
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage("images/55.png"),
                width: 200,
                height: 200,
              ),
            ),
            Text(
              "شركة مياة الشرب والصرف الصحي بالمنيا",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "الدورات الحالية ",
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            "اوفيس",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Course()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'images/download (1).jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "عدد المتدربين",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "50",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            "مسار وظيفي",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("images/download (3).jpg"),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "عدد المتدربين",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "78",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            "قواعد بيانات",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("images/download.png"),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "عدد المتدربين",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "92",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            "ترشيد المياة",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/download (2).jpg'),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "عدد المتدربين",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "80",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            "تواصل اجتماعي ",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset("images/images.jpg"),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.person,
                                size: 30,
                                color: Colors.blue,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "عدد المتدربين",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "65",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 1400,
                    height: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "اجمالي عدد المدربين",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "6",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "اجمالي عدد الناجحين",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "442",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "اجمالي عدد الراسبين",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "اجمالي عدد المتدربين",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "450",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "اجمالي عدد الدورات",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "8",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Segoe UI',
                                  letterSpacing: 0.3,
                                  height: 1.4,
                                  color: Color(0xff1d1b1e),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
