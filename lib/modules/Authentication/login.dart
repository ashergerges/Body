import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';
import 'package:body/shared/Components.dart';
import 'package:body/shared/Style.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(
                      child: Column(
                        children: const [
                          Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Login to your account ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 48.0, left: 10, right: 10),
                    child: Form(
                      key: AuthenticationCubit.get(context).formKeyLogin,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 18.0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email can not empty';
                                  }
                                  return null;
                                },
                                controller:
                                    AuthenticationCubit.get(context).emailLogin,
                                decoration: InputDecoration(
                                  // labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(17.0)),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: mainColor,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                onFieldSubmitted: (value) {},
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeFromHeight(context, 80),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: defaultFormField(
                                emailAddress: AuthenticationCubit.get(context)
                                    .passwordLogin,
                                text: '',
                                returnSyntex: 'password can not empty',
                                prefixicon: Icon(Icons.lock, color: mainColor),
                                suffix: AuthenticationCubit.get(context).suffix,
                                keyboardtype: TextInputType.visiblePassword,
                                suffixPressed: () {
                                  AuthenticationCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                ispassword:
                                    AuthenticationCubit.get(context).isPassword,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizeFromHeight(context, 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        if (AuthenticationCubit.get(context)
                            .formKeyLogin
                            .currentState!
                            .validate()) {
                          AuthenticationCubit.get(context).userLogin(
                            email: AuthenticationCubit.get(context)
                                .emailLogin
                                .text
                                .trim(),
                            password: AuthenticationCubit.get(context)
                                .passwordLogin
                                .text
                                .trim(),
                            context: context,
                          );
                        }
                      },
                      focusColor: Colors.white,
                      highlightColor: Colors.white,
                      hoverColor: Colors.white,
                      child: Container(
                          width: sizeFromWidth(context, 1.3),
                          height: sizeFromHeight(context, 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: mainColor,
                            // border: Border.all(color: Colors.green, width: 1.5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey, //New
                                  blurRadius: 10.0,
                                  offset: Offset(0, 10))
                            ],
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: const Center(
                              child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w900),
                          ))),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
