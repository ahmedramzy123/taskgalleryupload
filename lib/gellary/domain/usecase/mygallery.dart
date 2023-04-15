import 'dart:io';

import 'package:taskpromina/gellary/domain/entities/gallary_entities.dart';
import 'package:taskpromina/gellary/domain/repo/gallery_repo.dart';

class MyGallery
{
  GalleryRepo repo ;

  MyGallery(this.repo);

 Future <GalleryEntities> execute()async
  {
  return  await repo.myGallery();
  }
}


class Upload
{
  UploadRepo repo ;

  Upload(this.repo);
 Future<GalleryUpload> executeUpload(
     String file
     )async
  {
   return await repo.uploadRepo(file);
  }
}