
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskpromina/Auth/domain/usecase/login.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_state.dart';
import 'package:taskpromina/core/utiles/apiserveice/diohelper.dart';
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
       emit(SuccessAuthLogin(value.name));

       print(user.id);
     });
     print(user.name);

  }
List<String> list=[];
  void getMyGallery()async
  {
    emit(LoadingGetMyGallery());
      await gallery.execute().then((value)
   {
     list=value.image;
     print(list);
     emit(SuccessGetMyGallery());

   });
  }
  void uploadImage({required File file})async
  {BaseRemoteDataSourceUpload baseRemoteDataSourceUpload =RemoteDataSourceUpload();
    UploadRepo repo = GalleryRepoImplUpload(baseRemoteDataSourceUpload);
   var result = await Upload(repo).executeUpload(file);
   print(result.message);
  }
  File? imageFromGallery;
  void openGallery()async
  {
    ImagePicker x =ImagePicker();
    dynamic y = await x.pickImage(source: ImageSource.gallery);
    imageFromGallery = File(y.path);
  }
  File? imageFromCamera;
  void openCamera()async
  {
    ImagePicker x =ImagePicker();
    dynamic y = await x.pickImage(source: ImageSource.camera);
    print(y);
    imageFromCamera = File(y.path);
    uploadImage(file: imageFromCamera!);
    print(imageFromCamera.toString());
  }

}













