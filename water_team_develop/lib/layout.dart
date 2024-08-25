import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:water_team_develop/cubit.dart';
import 'package:water_team_develop/lang_cubit.dart';
import 'package:water_team_develop/login.dart';
import 'package:water_team_develop/shared_prafreance.dart';
import 'package:water_team_develop/state.dart';
import 'package:water_team_develop/widget.dart';

class layout extends StatefulWidget {
  const layout({super.key});

  @override
  State<layout> createState() => _layoutState();
}

class _layoutState extends State<layout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    Future refresh() async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const layout()),
      );
    }

    return BlocConsumer<dataCubit, dataStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = dataCubit.get(context);
          List<BottomNavigationBarItem> bootomitems = [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: const Icon(
                Icons.home,
              ),
              label:
                  context.watch<AppCubit>().state == 'ar' ? "الرئيسية" : "Home",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.favorite),
            //   label: context.watch<AppCubit>().state == 'ar'
            //       ? "المفضلة"
            //       : "Favourite",
            // ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.menu_book_rounded,
              ),
              label: context.watch<AppCubit>().state == 'ar'
                  ? "الامتحانات"
                  : "Exams",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.business,
            //   ),
            //   label: context.watch<AppCubit>().state == 'ar'
            //       ? "عن الصناعة"
            //       : "about industry",
            // )
          ];

          return Scaffold(
            backgroundColor: Colors.white,
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [],
              ),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: orangeColor,
                    ),
                    onPressed: () async {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  );
                },
              ),
              actions: [
                // IconButton(
                //   icon: Icon(
                //     Icons.email,
                //     color: orangeColor,
                //   ),
                //   onPressed: () async {
                //     // showDialog(
                //     //           context: context,
                //     //           barrierDismissible: false,
                //     //           barrierColor: myColor.withOpacity(
                //     //               0.8), // Set the opacity value as per your preference
                //     //           builder: (BuildContext context) {
                //     //             return Center(
                //     //               child: Lottie.asset(
                //     //                   "images/animation_lljh45pt.json"),
                //     //             );
                //     //           },
                //     //         );
                //     // await dataCubit.get(context).get_all_massages();
                //     //   Navigator.of(context).pop();
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //         builder: (context) => Inbox(),
                //       ),
                //     );
                //   },
                // ),
                // IconButton(
                //   icon: Icon(
                //     Icons.search,
                //     color: orangeColor,
                //   ),
                //   onPressed: () {
                //     // Navigator.push(
                //     //   context,
                //     //   MaterialPageRoute(
                //     //     builder: (context) => Search(),
                //     //   ),
                //     // );
                //   },
                // ),
              ],
            ),
            drawer: Drawer(
              surfaceTintColor: Colors.white,
              shadowColor: Colors.white,
              backgroundColor: Colors.white,
              child: ListView(
                children: [
                  Visibility(
                    visible: Cache.getdata(key: "loginscreen") ?? true,
                    child: ListTile(
                      leading: const Icon(Icons.login),
                      title: Text(
                        context.watch<AppCubit>().state == 'ar'
                            ? "تسجيل الدجول"
                            : "Log In ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                    ),
                  ),
                  Visibility(
                    visible: Cache.getdata(key: 'logout') ?? false,
                    child: ListTile(
                      leading: const Icon(Icons.logout),
                      title: Text(
                        context.watch<AppCubit>().state == 'ar'
                            ? "تسجيل خروج"
                            : "Log out ",
                        style: const TextStyle(fontSize: 18),
                      ),
                      onTap: () async {
                        // channel.sink.close(1001, "logout");

                        // Handle drawer item click for Settings
                      },
                    ),
                  ),
                  // Add more list tiles for other drawer options
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: bootomitems,
              currentIndex: cubit.crrentindex,
              onTap: (index) {
                cubit.change(index);
              },
              backgroundColor: Colors.white,
              selectedItemColor: orangeColor,
              unselectedItemColor: darkBlueColor,
            ),
            body: OfflineBuilder(
                connectivityBuilder: (
                  BuildContext context,
                  ConnectivityResult connectivity,
                  Widget child,
                ) {
                  final bool connected =
                      connectivity != ConnectivityResult.none;
                  return connected
                      ? cubit.screens[cubit.crrentindex]
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "You are Offline",
                              style:
                                  TextStyle(fontSize: 30, color: darkBlueColor),
                            ),
                          ],
                        );
                },
                child: Container()),
          );
        });
  }
}
