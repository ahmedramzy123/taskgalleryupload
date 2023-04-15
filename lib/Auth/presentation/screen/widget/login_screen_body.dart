import 'package:flutter/material.dart';
import 'package:taskpromina/Auth/presentation/controller/cubit/auth_cubit/auth_cubit.dart';
import 'package:taskpromina/core/utiles/styles.dart';


class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({Key? key}) : super(key: key);
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset("assets/login in.jpeg",fit: BoxFit.fill,width: double.infinity,height: 850,),
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Container(
              width: 345,
              height: 388,
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children:   [
                  const SizedBox(height: 36,),
                  const Text("Log in",style: Style.textStyle30,),
                  const SizedBox(height: 39,),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 21,top: 12,bottom: 17,end: 20),
                    width: 282,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,

                    ),
                    child: TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                          hintText: "User Name",
                          hintStyle: Style.textStyle16,
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(height: 55,),
                  Container(
                    padding: const EdgeInsetsDirectional.only(start: 21,top: 12,bottom: 17,end: 20),
                    width: 282,
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.white,

                    ),
                    child: TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: Style.textStyle16,
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  const SizedBox(height: 38,),
                  Container(
                    width: 282,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Color(0xff7BB3FF)
                    ),
                    child: MaterialButton(
                      onPressed: ()
                      {
                        AppCubit.get(context).authLogin(email: _username.text, password: _password.text);
                      },
                      child: Text("Submit",style: Style.textStyle18,),

                    ),
                  )

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
