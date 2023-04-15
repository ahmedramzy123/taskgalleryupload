
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskpromina/Auth/domain/usecase/login.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_state.dart';
import 'package:taskpromina/core/services/services_locator.dart';
import 'package:taskpromina/core/utiles/apiserveice/diohelper.dart';
import 'package:taskpromina/core/utiles/sharedprefrences.dart';
import 'package:taskpromina/gellary/data/datasource/remote_data_source_gallery.dart';
import 'package:taskpromina/gellary/data/repo/repo_data.dart';
import 'package:taskpromina/gellary/domain/repo/gallery_repo.dart';
import 'package:taskpromina/gellary/domain/usecase/mygallery.dart';
class AppCubit extends Cubit<AppState>
{
  AppCubit(this.login,this.gallery) :super(InitialAuthCubit());
  final Login login;
  final MyGallery gallery;

  static AppCubit get(context) => BlocProvider.of(context);
var user;
  void authLogin({
    required String email,
    required String password,
})async
  {
    emit(LoadingAuthLogin());
      await login.execute(email, password).then((value)
     {
       user =value ;
       AppPreferences.saveString(value.token, AppPreferences.TOKEN);
       AppPreferences.saveString(value.name, AppPreferences.NAME);
       emit(SuccessAuthLogin(value.name));

     });

  }
List<String> list=[];
  void getMyGallery()async
  {
    emit(LoadingGetMyGallery());
      await gallery.execute().then((value)
   {
     list=value.image;
     print(list);
   });
    Future<void> .delayed(const Duration(milliseconds: 50)) ;
    emit(SuccessGetMyGallery());

  }
  void uploadImage({required String file})async
  {
   var result = await Upload(getIt()).executeUpload(file).then((value)
   {
     getMyGallery();

   });
   emit(UploadImageSuccess());
   print(result.message);
  }
  void openGallery()async
  {
    ImagePicker picker =ImagePicker();
     await picker.pickImage(source: ImageSource.gallery).then((value)
    {
      uploadImage(file: value!.path);

    });


  }
  void openCamera()async
  {
    ImagePicker picker =ImagePicker();
     await picker.pickImage(source: ImageSource.camera).then((value)
    {
      uploadImage(file: value!.path);
    });



  }

}













