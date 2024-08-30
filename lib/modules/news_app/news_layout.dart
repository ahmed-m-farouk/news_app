import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/search_screeen/searchscreen.dart';
import 'package:news_app/shared/component/conponents/conponents.dart';
import 'package:news_app/shared/cupite/cubit.dart';
import 'package:news_app/shared/cupite/state.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News_App',
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, Searchscreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                onPressed: () {
                  print('Before ${cubit.isDark}');

                  cubit.changeMode(); // تغيير وضع الدارك مود
                  print('After ${cubit.isDark}');
                },
                icon: Icon(
                  cubit.isDark ? Icons.dark_mode : Icons.light_mode,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.cunternum],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.cunternum,
            items: cubit.bottomItme,
            elevation: 25,
            onTap: ((index) {
              cubit.bottomNavigation(index);
            }),
          ),
        );
      },
    );
  }
}
