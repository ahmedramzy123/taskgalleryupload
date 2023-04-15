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
  Future<GalleryModelUpload> uploadDataSource(String file);
}
class RemoteDataSourceUpload implements BaseRemoteDataSourceUpload{

  @override
  Future<GalleryModelUpload> uploadDataSource(String file)async {
    FormData formData = FormData.fromMap(
        {'img':await MultipartFile.fromFile(file,filename: "image.png")});
    var image =await DioHelper.uploadFile(endPoint: "upload", data:formData);
   print(image.statusCode);
   return GalleryModelUpload.fromJson(image.data);
  }
}