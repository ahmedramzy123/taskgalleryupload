import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:taskpromina/core/utiles/apiserveice/diohelper.dart';
import 'package:taskpromina/gellary/data/model/gallery_model.dart';

abstract class BaseRemoteDataSourceGallery
{
  Future<GalleryModel> galleryDataSource();
}

class RemoteDataSourceGallery implements BaseRemoteDataSourceGallery
{
  @override
  Future<GalleryModel> galleryDataSource()async {
   var list =  await DioHelper.getData(endPoint: "my-gallery");
   return GalleryModel.fromJson(list.data);

  }

}

abstract class BaseRemoteDataSourceUpload
{
  Future<GalleryModelUpload> uploadDataSource(File file);
}
class RemoteDataSourceUpload implements BaseRemoteDataSourceUpload{
  @override
  Future<GalleryModelUpload> uploadDataSource(File file)async {
   var image =await DioHelper.postData(endPoint: "upload", data:
   {
     "img": file.path
   });
   print(image.statusCode);
   return GalleryModelUpload.fromJson(image.data);
  }
}