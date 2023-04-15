import 'dart:io';

import 'package:taskpromina/gellary/data/datasource/remote_data_source_gallery.dart';
import 'package:taskpromina/gellary/domain/entities/gallary_entities.dart';
import 'package:taskpromina/gellary/domain/repo/gallery_repo.dart';

class GalleryRepoImp implements GalleryRepo
{
final BaseRemoteDataSourceGallery baseRemoteDataSourceGallery;

GalleryRepoImp(this.baseRemoteDataSourceGallery);

  @override
  Future<GalleryEntities> myGallery()async {
  return await baseRemoteDataSourceGallery.galleryDataSource();
  }

}

class GalleryRepoImplUpload implements UploadRepo{
  final BaseRemoteDataSourceUpload baseRemoteDataSourceUpload;

  GalleryRepoImplUpload(this.baseRemoteDataSourceUpload);

  @override
  Future<GalleryUpload> uploadRepo(String file) async{
   return await baseRemoteDataSourceUpload.uploadDataSource(file);
  }
}