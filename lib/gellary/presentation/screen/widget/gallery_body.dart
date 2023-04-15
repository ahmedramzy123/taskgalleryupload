import 'package:flutter/material.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_cubit.dart';
import 'package:taskpromina/core/utiles/sharedprefrences.dart';
import 'package:taskpromina/core/utiles/styles.dart';
import 'package:taskpromina/gellary/presentation/screen/widget/list_view_gallery.dart';

class GalleryBody extends StatefulWidget {
  const GalleryBody({Key? key}) : super(key: key);

  @override
  State<GalleryBody> createState() => _GalleryBodyState();
}

class _GalleryBodyState extends State<GalleryBody> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getMyGallery();
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Image.asset(
          "assets/gallary.jpeg",
          fit: BoxFit.fill,
          width: double.infinity,
          height: 850,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 27),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SizedBox(
                      width: 143,
                      height: 90,
                      child: Text(
                        "Welcome ${AppPreferences.getString(AppPreferences.NAME)}",
                        style: Style.textStyle32,
                      ),
                    ),
                    const Spacer(),
                    const Padding(
                        padding:
                        EdgeInsets.only(left: 33, bottom: 40),
                        child: CircleAvatar(
                          radius: 66,
                          backgroundImage: NetworkImage(
                              "https://img.freepik.com/free-photo/handsome-young-man-with-new-stylish-haircut_176420-19637.jpg?size=626&ext=jpg&ga=GA1.2.1405713195.1681253397&semt=sph"),
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 51, left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    width: 145,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white60),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 29,
                          decoration: BoxDecoration(
                              color: const Color(0xffFB4949),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          width: 22,
                        ),
                        const Text(
                          "Log out",
                          style: Style.textStyle20,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: ()
                    {
                      showDialog(context: context,
                          builder: (context)=>Padding(
                            padding: const EdgeInsets.only(left: 38,right: 37),
                            child: Center(
                              child: Container(
                                width: 353,
                                height: 270,
                                decoration: BoxDecoration(
                                    color: Color(0xfffffff),
                                    borderRadius: BorderRadius.circular(32)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 184,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffEFD8F9)
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/gallery.png"),
                                          TextButton(child:Text("Gellary",style: Style.textStyle27,),onPressed: ()
                                          {
                                            AppCubit.get(context).openGallery();
                                          },)
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 44,),
                                    Container(
                                      width: 184,
                                      height: 65,
                                      child: Row(
                                        children: [
                                          Image.asset("assets/camera.png"),
                                          TextButton(child: Text("Camera",style: Style.textStyle27,),onPressed: ()
                                          {
                                            AppCubit.get(context).openCamera();
                                          },)
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xffEFD8F9)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      width: 145,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white60),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 29,
                            decoration: BoxDecoration(
                                color: const Color(0xffFF9900),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.upload,
                              color: Colors.white60,
                            ),
                          ),
                          const SizedBox(
                            width: 22,
                          ),
                          const Text(
                            "Upload",
                            style: Style.textStyle20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 34,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                crossAxisCount: 3,
                children: List.generate(
                    AppCubit.get(context).list.length, (index) => ListViewGallery(AppCubit.get(context).list[index])),
              ),
            ),
          ],
        )
      ],
    );
  }
}
