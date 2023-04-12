import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_cubit.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_state.dart';
import 'package:taskpromina/gellary/presentation/screen/widget/gallery_body.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        return const Scaffold(
          body: GalleryBody(),
        );
      },

    );
  }
}
















