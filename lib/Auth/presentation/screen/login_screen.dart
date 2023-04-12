import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_cubit.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_state.dart';
import 'package:taskpromina/Auth/presentation/screen/widget/login_screen_body.dart';
import 'package:taskpromina/gellary/presentation/screen/gallary_screen.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppState>(
      listener: (context,state)
      {
        if (state is SuccessAuthLogin)
          {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(
                builder: (context)=>const GalleryScreen()),
                    (route) => false);
          }
      },
      builder: (context,state)
      {
        return Scaffold(
          body: LoginScreenBody()
        );
      },
    );
  }
}

