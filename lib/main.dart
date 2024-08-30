import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/bloc_observer.dart'; // تأكد من المسار الصحيح
import 'package:news_app/shared/network/remote/dio_helper.dart'; // تأكد من المسار الصحيح
import 'package:news_app/modules/news_app/news_layout.dart';
import 'package:news_app/shared/cupite/cubit.dart';
import 'package:news_app/shared/cupite/state.dart';
import 'package:news_app/shared/themeth/themth.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getBusiness()
        ..getSportes()
        ..getScience(), // تأكد من تهيئة AppCubit
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // يمكن إضافة إجراءات بناءً على الحالة إذا لزم الأمر
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightThemeh(),
            darkTheme: darkthemth(),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: const Directionality(
              textDirection: TextDirection.rtl,
              child: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
