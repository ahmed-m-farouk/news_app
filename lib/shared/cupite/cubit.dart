import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Setting/setting.dart';
import 'package:news_app/shared/cupite/state.dart';
import 'package:news_app/modules/news/business_news.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int cunternum = 0;
  List<BottomNavigationBarItem> bottomItme = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball_outlined), label: 'Sprots'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];
  List<Widget> screens = const [
    BusinessNews(),
    Sports(),
    Science(),
    Setting(),
  ];
  void bottomNavigation(int index) {
    cunternum = index;
    if (index == 1) getSportes();
    if (index == 2) getBusiness();

    emit(BottomNavigation());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBussinessLoodingstate());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'f2c17e45491542d68745dbbcefcf87bd',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsgetBusinessScussstate());
    }).catchError((error) {
      ('Errrorr!!${error.toString()}');
      emit(NewsgetBusinessErorrstate(error));
    });
  }

  List<dynamic> sports = [];
  void getSportes() {
    emit(NewsSportesLoodingstate());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'f2c17e45491542d68745dbbcefcf87bd',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsgetSportesScussstate());
      }).catchError((error) {
        ('Errrorr!!${error.toString()}');
        emit(NewsgetSportesErorrstate(error));
      });
    } else {
      emit(NewsgetSportesScussstate());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsScienceLoodingstate());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'f2c17e45491542d68745dbbcefcf87bd',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsgetScienceScussstate());
      }).catchError((error) {
        ('Errrorr!!${error.toString()}');
        emit(NewsgetScienceErorrstate(error));
      });
    } else {
      emit(NewsgetScienceScussstate());
    }
  }

  bool isDark = false;

  void changeMode() {
    isDark = !isDark;
    emit(ChangeModeeState());
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoodingstate());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': 'f2c17e45491542d68745dbbcefcf87bd',
      },
    ).then((value) {
      search = value.data['articles'];

      if (search.isNotEmpty) {
        print(search[0]['title']);
      } else {
        print('No results found');
      }

      emit(NewsgetSearchScussstate());
    }).catchError((error) {
      if (error is DioException) {
        // Handling specific DioException based on the type
        if (error.response?.statusCode == 400) {
          emit(NewsgetSearchErorrstate(
              "Bad Request: The request could not be processed."));
        } else {
          emit(NewsgetSearchErorrstate("An error occurred: ${error.message}"));
        }
      } else {
        emit(NewsgetSearchErorrstate("An unknown error occurred."));
      }
    });
  }
}
