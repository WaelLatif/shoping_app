// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoping_app/styles/themes.dart';
import 'components/constance.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layout/on_boarding_screen.dart';
import 'network/local/cash_helper.dart';
import 'network/remote/dio_helper.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
        () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {


  bool? isDark;

  MyApp(this.isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopCubit()
            ..changeAppMode(
              fromShared: isDark,
            )
        ),
      ],
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, ShopStates state) {
          var cubit = ShopCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
