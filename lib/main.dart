import 'package:flutter/material.dart';
import 'package:flutter_46home/data/repository/quran_app_repo.dart';
import 'package:flutter_46home/presentation/screens/main_screen.dart';
import 'package:flutter_46home/presentation/screens/splash_screen.dart';
import 'package:flutter_46home/provider/quran_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(300, 800),
      child: ChangeNotifierProvider(
        create: (context) =>
            QuranProvider(quranAppRepo: QuranAppRepo())..fetchSurah(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainScreen(),
        ),
      ),
    );
  }
}
