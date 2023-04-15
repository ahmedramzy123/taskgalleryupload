import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskpromina/Auth/presentation/screen/login_screen.dart';
import 'package:taskpromina/core/services/services_locator.dart';
import 'package:taskpromina/core/utiles/apiserveice/diohelper.dart';
import 'package:taskpromina/core/utiles/sharedprefrences.dart';

import 'Auth/presentation/controller/cubit/auth_cubit/auth_cubit.dart';
import 'gellary/presentation/screen/gallary_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  AppPreferences.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>AppCubit(getIt(),getIt())
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          textTheme: GoogleFonts.balooThambi2TextTheme(
            ThemeData.light().textTheme
          )
        ),
        home:   LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints ) {
              print(constraints.minWidth.toInt());

              if(AppPreferences.getString(AppPreferences.TOKEN) == null)
              {
                print(AppPreferences.getString(AppPreferences.TOKEN));
                return LoginScreen();
              }
              return const GalleryScreen();
            },
        )
      ),
    );
  }
}

