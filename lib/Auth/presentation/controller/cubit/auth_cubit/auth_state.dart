abstract class AppState{}
class InitialAuthCubit extends AppState{}
class LoadingAuthLogin extends AppState{}
class SuccessAuthLogin extends AppState{
  final String name ;

  SuccessAuthLogin(this.name);
}
class LoadingGetMyGallery extends AppState{}
class SuccessUploadImage extends AppState{}
class UploadImageSuccess extends AppState{}
class SuccessGetMyGallery extends AppState
{

}