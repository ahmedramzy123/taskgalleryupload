import 'dart:io';

import 'package:taskpromina/gellary/domain/entities/gallary_entities.dart';

abstract class GalleryRepo
{
  Future <GalleryEntities> myGallery();
}

abstract class UploadRepo
{
  Future<GalleryUpload> uploadRepo(String file);
}