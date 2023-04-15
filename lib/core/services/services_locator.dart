
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskpromina/Auth/data/datasource/remote_datasource.dart';
import 'package:taskpromina/Auth/data/repo/login_repo.dart';
import 'package:taskpromina/Auth/domain/repo/login_user.dart';
import 'package:taskpromina/Auth/domain/usecase/login.dart';
import 'package:taskpromina/core/utiles/sharedprefrences.dart';
import 'package:taskpromina/gellary/data/datasource/remote_data_source_gallery.dart';
import 'package:taskpromina/gellary/data/repo/repo_data.dart';
import 'package:taskpromina/gellary/domain/repo/gallery_repo.dart';
import 'package:taskpromina/gellary/domain/usecase/mygallery.dart';

final getIt = GetIt.instance;

class ServicesLocator
{
  init()
  {
    ///Data source login
    getIt.registerLazySingleton<BaseRemoteDataSource>(() => RemoteDataSource());

    ///repo login
    getIt.registerLazySingleton<BaseLoginRepo>(() => LoginRepo(getIt()));

    ///usecase login
    getIt.registerLazySingleton(() => Login(getIt()));
    
    
    ///Data source gallery
    getIt.registerLazySingleton<BaseRemoteDataSourceGallery>(() => RemoteDataSourceGallery());
    /// repo gallery
    getIt.registerLazySingleton<GalleryRepo>(() => GalleryRepoImp(getIt()));
    ///usecase gallery
    getIt.registerLazySingleton(() => MyGallery(getIt()));


    getIt.registerLazySingleton<BaseRemoteDataSourceUpload>(() => RemoteDataSourceUpload());
    getIt.registerLazySingleton<UploadRepo>(() => GalleryRepoImplUpload(getIt()));



  }
}