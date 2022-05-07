// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/cubit/states.dart';


import '../network/local/cash_helper.dart';
import '../network/remote/dio_helper.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_handball_rounded,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];
  List<Widget> screens = [

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    if (index == 0) getBusiness();
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(ShopBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(ShopGetBusinessLoadingState());

    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '49bf6f86673e462fa2d75433bb88b625',
        },
      ).then((value) {
        business = value?.data['articles'];
        emit(ShopGetBusinessSuccessState());
      }).catchError((error) {
        emit(ShopGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(ShopGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(ShopGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '49bf6f86673e462fa2d75433bb88b625',
        },
      ).then((value) {
        sports = value?.data['articles'];

        emit(ShopGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ShopGetSportsErrorState(error.toString()));
      });
    } else {
      emit(ShopGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(ShopGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '49bf6f86673e462fa2d75433bb88b625',
        },
      ).then((value) {
        science = value?.data['articles'];
        emit(ShopGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(ShopGetScienceErrorState(error.toString()));
      });
    } else {
      emit(ShopGetScienceSuccessState());
    }
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
    } else {
      isDark = !isDark;
    }
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(ShopChangeThemeState());
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(ShopGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '49bf6f86673e462fa2d75433bb88b625',
      },
    ).then((value) {
      search = value?.data['articles'];
      emit(ShopGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetSearchErrorState(error.toString()));
    });
  }
}
