import 'package:flutter/material.dart';
import 'package:fluttertest/views/screen/splach.dart';
import 'package:fluttertest/views/screen/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
         debugShowCheckedModeBanner: false
        ,initialRoute: '/',
        routes: {
           '/':(context)=>Splach(),
          '/home':(context)=>Home()
        },
      ),
    );
  }
}
