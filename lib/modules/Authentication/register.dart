import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';
import 'package:body/shared/Components.dart';
import 'package:body/shared/Style.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);


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
                physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Center(child: Column(
                      children: const [
                        Text('Sign Up',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),),
                        SizedBox(height: 30,),
                        Text(
                          "Create an account it's free ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                      ],
                    ),),
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: ()
                    {
                      AuthenticationCubit.get(context).getUpdateImage();
                    },
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.20,
                      backgroundColor: mainColor,
                      backgroundImage: AuthenticationCubit.get(context).updateImage==null ? null : FileImage(File(AuthenticationCubit.get(context).updateImage!.path)),
                      child: AuthenticationCubit.get(context).updateImage == null
                          ?
                      Text('Choose Image',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color: totoColor),) : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0,left: 10,right: 10),
                    child: Form(
                      key: AuthenticationCubit.get(context).formKeySignUp,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Full Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: TextFormField(

                                validator: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Full Name can not empty';
                                  }
                                  return null;

                                },
                                controller: AuthenticationCubit.get(context).nameSignUp,
                                decoration: InputDecoration(
                                  // labelText: 'Full Name',
                                  //border: InputBorder.none,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),
                                  prefixIcon:  Icon(
                                    Icons.person,
                                    color: mainColor,
                                  ),

                                ),
                                keyboardType:TextInputType.name,
                                onFieldSubmitted: (value){

                                },
                                onChanged: (value){

                                },

                              ),
                            ),
                          ),
                          SizedBox(
                            //height: 10.0,
                            height: sizeFromHeight(context, 100),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Email',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: TextFormField(
                                validator: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Email can not empty';
                                  }
                                  else if(!value.contains('@gmail.com'))
                                  {
                                    return 'please enter a valid email address';
                                  }
                                  return null;


                                },
                                controller: AuthenticationCubit.get(context).emailSignUp,
                                decoration: InputDecoration(
                                  // labelText: 'Email',
                                  //border: InputBorder.none,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),
                                  prefixIcon:  Icon(
                                      Icons.email,
                                      color: mainColor
                                  ),

                                ),
                                keyboardType:TextInputType.emailAddress,
                                onFieldSubmitted: (value){

                                },
                                onChanged: (value){

                                },

                              ),
                            ),
                          ),
                          SizedBox(

                            height: sizeFromHeight(context, 100),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Age',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: TextFormField(

                                validator: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Age can not empty';
                                  }
                                  return null;

                                },
                                controller: AuthenticationCubit.get(context).ageSignUp,
                                decoration: InputDecoration(
                                  // labelText: 'Full Name',
                                  //border: InputBorder.none,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),
                                  prefixIcon:  Icon(
                                    Icons.date_range,
                                    color: mainColor,
                                  ),

                                ),
                                keyboardType:TextInputType.number,
                                onFieldSubmitted: (value){

                                },
                                onChanged: (value){

                                },

                              ),
                            ),
                          ),
                          SizedBox(
                            //height: 10.0,
                            height: sizeFromHeight(context, 100),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Gender',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: TextFormField(

                                validator: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'Gender can not empty';
                                  }
                                  else if(value!='male' && value!='female'){

                                    return 'Gender male or female';
                                  }
                                  return null;

                                },
                                controller: AuthenticationCubit.get(context).genderSignUp,
                                decoration: InputDecoration(
                                  // labelText: 'Full Name',
                                  //border: InputBorder.none,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),
                                  prefixIcon:  Icon(
                                    Icons.male_sharp,
                                    color: mainColor,
                                  ),

                                ),
                                keyboardType:TextInputType.name,
                                onFieldSubmitted: (value){

                                },
                                onChanged: (value){

                                },

                              ),
                            ),
                          ),
                          SizedBox(
                            //height: 10.0,
                            height: sizeFromHeight(context, 100),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Phone',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: TextFormField(

                                validator: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return 'phone can not empty';
                                  }
                                  else if (value.length>11)
                                  {
                                    return 'phone number must consist of 11 ';
                                  }
                                  else if (value.length<11)
                                  {
                                    return 'phone number must consist of 11 ';
                                  }
                                  return null;

                                },
                                controller: AuthenticationCubit.get(context).phoneSignUp,
                                decoration: InputDecoration(
                                  //  labelText: 'Phone Number',

                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),

                                  prefixIcon:  Icon(
                                      Icons.phone_android_outlined,
                                      color: mainColor
                                  ),

                                ),
                                keyboardType:TextInputType.number,
                                onFieldSubmitted: (value){

                                },
                                onChanged: (value){

                                },

                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeFromHeight(context, 100),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text('Password',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(

                              child: defaultFormField(
                                emailAddress: AuthenticationCubit.get(context).passwordSignUp,
                                text: '',
                                returnSyntex: 'password can not empty',
                                prefixicon:  Icon(Icons.lock,color: mainColor),
                                keyboardtype: TextInputType.visiblePassword,
                                ispassword: AuthenticationCubit.get(context).isPassword ,
                                suffix: AuthenticationCubit.get(context).suffix,
                                suffixPressed: ()
                                {
                                  AuthenticationCubit.get(context).changePasswordVisibility();
                                },


                              ),
                            ),
                          ),
                          SizedBox(
                            height: sizeFromHeight(context, 60),
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(AuthenticationCubit.get(context).updateImage==null){
                          showToast(text: 'You Must Select image',state: ToastStates.ERROR);
                        }
                        else{
                          if (AuthenticationCubit.get(context).formKeySignUp.currentState!.validate()) {
                            AuthenticationCubit.get(context).userRegister(
                                name: AuthenticationCubit.get(context).nameSignUp.text.trim(),
                                phone:AuthenticationCubit.get(context).phoneSignUp.text.trim() ,
                                email: AuthenticationCubit.get(context).emailSignUp.text.trim(),
                                password: AuthenticationCubit.get(context).passwordSignUp.text.trim(),
                                context: context,
                                age:  AuthenticationCubit.get(context).ageSignUp.text.trim(),
                                gender:  AuthenticationCubit.get(context).genderSignUp.text.trim(),
                            );
                          }
                          else{
                            showToast(text: 'Try again,and enter right data',state: ToastStates.ERROR);
                          }
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
                          child: const Center(child: Text('Sign Up',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),))),
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            )
          );
        },
      ),
    );

  }
}
