import 'package:taskpromina/gellary/domain/entities/gallary_entities.dart';

class GalleryModel extends GalleryEntities
{
  GalleryModel(super.image);

 factory GalleryModel.fromJson(Map<String,dynamic> json )=> GalleryModel(
     List<String>.from(json["data"]["images"]));

}


class GalleryModelUpload extends GalleryUpload
{
  GalleryModelUpload (super.message);

  factory GalleryModelUpload.fromJson(Map<String,dynamic> json)=>
      GalleryModelUpload(json["message"]);
}