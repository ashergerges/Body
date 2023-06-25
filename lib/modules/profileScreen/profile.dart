import 'package:body/models/FoodSystemModel.dart';
import 'package:body/models/FoodSystemUserModel.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';
import 'package:body/modules/profileScreen/detailesFoodSystem.dart';
import 'package:body/shared/Components.dart';
import 'package:body/shared/Style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit()..getFoodSystem()..getProfile()..getFoodSystemUser(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return FirebaseAuth.instance.currentUser!.uid.toString()==systemId? SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0,right: 15,left: 15),
                  child: Container(
                    padding: EdgeInsets.all(5),

                    width:  sizeFromWidth(context, 1),
                    decoration:  BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: twoColor, //New
                            blurRadius: 10.0,
                            offset: Offset(0, 10))
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width:sizeFromWidth(context, 1),
                          child: Form(
                            key: AuthenticationCubit.get(context).formKeyFoodSystem,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: sizeFromWidth(context, 2.5),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Code can not empty';
                                          }

                                          return null;
                                        },
                                        controller: AuthenticationCubit.get(context).foodSystemCode,
                                        decoration: InputDecoration(
                                          labelText: 'Code',
                                          labelStyle: TextStyle(fontSize: 14,fontWeight:FontWeight.w900),

                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(17.0)),
                                          prefixIcon:  Icon(
                                            Icons.code,
                                            color: totoColor,
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: (value) {},
                                        onChanged: (value) {},
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: sizeFromWidth(context, 1),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.all(sizeFromWidth(context, 40)),
                                        child: Container(
                                          width: sizeFromWidth(context, 2.5),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'From weight can not empty';
                                              }

                                              return null;
                                            },
                                            controller: AuthenticationCubit.get(context).foodSystemFromAge,
                                            decoration: InputDecoration(
                                              labelText: 'From weight',
                                              labelStyle: TextStyle(fontSize: sizeFromWidth(context, 35),fontWeight:FontWeight.w900),

                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(17.0)),
                                              prefixIcon:  Icon(
                                                Icons.monitor_weight_sharp,
                                                color: totoColor,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            onFieldSubmitted: (value) {},
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.all(sizeFromWidth(context, 40)),
                                        child: Container(
                                          width: sizeFromWidth(context, 2.7),
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'To weight can not empty';
                                              }

                                              return null;
                                            },
                                            controller: AuthenticationCubit.get(context).foodSystemToAge,
                                            decoration: InputDecoration(
                                              labelText: 'To weight',
                                              labelStyle: TextStyle(fontSize: sizeFromWidth(context, 35),fontWeight:FontWeight.w900),

                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(17.0)),
                                              prefixIcon:  Icon(
                                                Icons.monitor_weight_sharp,
                                                color: totoColor,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            onFieldSubmitted: (value) {},
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),

                                  child: Container(
                                    width: sizeFromWidth(context, 1.18),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Breakfast can not empty';
                                        }
                                        return null;
                                      },
                                      controller: AuthenticationCubit.get(context).foodSystemBreakfast,
                                      decoration: InputDecoration(
                                        labelText: 'Breakfast',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(17.0)),
                                        prefixIcon:  Icon(
                                          Icons.fastfood,
                                          color: totoColor,
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {},
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: sizeFromWidth(context, 1.18),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Lunch can not empty';
                                        }
                                        return null;
                                      },
                                      controller: AuthenticationCubit.get(context).foodSystemLunch,
                                      decoration: InputDecoration(
                                        labelText: 'Lunch',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(17.0)),
                                        prefixIcon:  Icon(
                                          Icons.lunch_dining,
                                          color: totoColor,
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {},
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: sizeFromWidth(context, 1.18),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Dinner can not empty';
                                        }
                                        return null;
                                      },
                                      controller: AuthenticationCubit.get(context).foodSystemDinner,
                                      decoration: InputDecoration(
                                        labelText: 'Dinner',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(17.0)),
                                        prefixIcon:  Icon(
                                          Icons.dinner_dining,
                                          color: totoColor,
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {},
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: sizeFromWidth(context, 1.18),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Extra Meal can not empty';
                                        }
                                        return null;
                                      },
                                      controller: AuthenticationCubit.get(context).foodSystemExtraMeal,
                                      decoration: InputDecoration(
                                        labelText: 'Extra Meal',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(17.0)),
                                        prefixIcon:  Icon(
                                          Icons.food_bank_sharp,
                                          color: totoColor,
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {},
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: sizeFromWidth(context,1.18),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Notice can not empty';
                                        }
                                        return null;
                                      },
                                      controller: AuthenticationCubit.get(context).foodSystemNotice,
                                      decoration: InputDecoration(
                                        labelText: 'Notice',
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(17.0)),
                                        prefixIcon:  Icon(
                                          Icons.notes,
                                          color: totoColor,
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      onFieldSubmitted: (value) {},
                                      onChanged: (value) {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              if (AuthenticationCubit.get(context).formKeyFoodSystem.currentState!.validate())
                              {
                                AuthenticationCubit.get(context).setFoodSystem();
                              }
                              else {
                                showToast(
                                    text: 'Try again,and enter right data',
                                    state: ToastStates.ERROR);
                              }
                            },
                            focusColor: Colors.white,
                            highlightColor: Colors.white,
                            hoverColor: Colors.white,
                            child: Container(
                                width: sizeFromWidth(context, 1.3),
                                height: sizeFromHeight(context, 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  color: totoColor,
                                  // border: Border.all(color: Colors.green, width: 1.5),

                                ),
                                padding: const EdgeInsets.all(10.0),
                                child: const Center(child: Text('Add food system',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //

                Padding(
                  padding: const EdgeInsets.only(left: 18.0,top: 10),
                  child:   Row(
                    children: [
                      Icon(Icons.history),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'History',
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ),
                ///system
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: textFormField(
                      controller:AuthenticationCubit.get(context).searchFoodSystemController,
                      type: TextInputType.text,
                      validate: (value) {
                        return null;
                      },
                      hint: "    Search .....",
                      isExpanded: true,
                      fromLTR: false,
                      onTap: () {
                        AuthenticationCubit.get(context).getFoodSystem();
                      },
                      onChange: (value) {
                        if (AuthenticationCubit.get(context).searchFoodSystemController.text ==
                            '' || AuthenticationCubit.get(context).foodSystem.isEmpty) {
                          AuthenticationCubit.get(context).getFoodSystem();
                        }
                        AuthenticationCubit.get(context).searchAboutFoodSystem(value);


                      }),
                ),
                ConditionalBuilder(
                  //condition: true,
                  condition: AuthenticationCubit.get(context).foodSystem.isNotEmpty,
                  builder: (context) =>  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildFoodItemSystem(AuthenticationCubit.get(context).foodSystem[index] ,context,index);

                    },
                    separatorBuilder: (context, index) =>
                        divider(10, 10, white),

                    itemCount: AuthenticationCubit.get(context).foodSystem.length,
                    //itemCount: 15,
                  ),
                  fallback: (context) => Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: materialWidget(
                        context,
                        sizeFromHeight(context, 3, hasAppBar: true),
                        sizeFromWidth(context, 1),
                        20,
                        null,
                        BoxFit.fill,
                        [
                          textWidget(
                            'There are no Food System added',
                            null,
                            null,
                            mainColor,
                            sizeFromWidth(context, 20),
                            FontWeight.bold,
                          ),
                        ],
                        MainAxisAlignment.center,
                        false,
                        10,
                        totoColor,
                            () {},
                      ),
                    ),
                  ),
                ),

                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      AuthenticationCubit.get(context).logout(context);
                    },
                    focusColor: Colors.white,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    child: Container(
                        width: sizeFromWidth(context, 1.3),
                        height: sizeFromHeight(context, 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: totoColor,
                          // border: Border.all(color: Colors.green, width: 1.5),

                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Center(child: Text('Log Out',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
                  ),
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ):
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ConditionalBuilder(
                  condition:AuthenticationCubit.get(context).modelProfile !=null,
                  builder: (context) =>  Padding(
                    padding: const EdgeInsets.only(top: 80.0,right: 15,left: 15),
                    child: Container(
                      padding: EdgeInsets.all(5),

                      width:  sizeFromWidth(context, 1),
                      decoration:  BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: twoColor, //New
                              blurRadius: 10.0,
                              offset: Offset(0, 10))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: sizeFromWidth(context, 4.5),
                            child: storyShape(
                              // context, white, NetworkImage((model.image)), 20, 22),
                                context, white,  NetworkImage(AuthenticationCubit.get(context).modelProfile!.image), 9, 10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Age :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text(AuthenticationCubit.get(context).modelProfile!.age,
                                      style: TextStyle(fontSize:sizeFromWidth(context, 20), fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Email :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text(AuthenticationCubit.get(context).modelProfile!.email,style: TextStyle(fontSize: sizeFromWidth(context, 25), fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Phone :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text(AuthenticationCubit.get(context).modelProfile!.phone,style: TextStyle(fontSize: sizeFromWidth(context, 20), fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Gender :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text(AuthenticationCubit.get(context).modelProfile!.gender,style: TextStyle(fontSize: sizeFromWidth(context, 20), fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Full Name :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text(AuthenticationCubit.get(context).modelProfile!.name,style: TextStyle(fontSize: sizeFromWidth(context, 20), fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sizeFromHeight(context, 60),
                              ),

                            ],
                          ),
                          const SizedBox(height: 10,),

                        ],
                      ),
                    ),
                  ),

                  fallback: (context) => Padding(
                    padding: const EdgeInsets.only(top: 80.0,right: 15,left: 15),
                    child: Container(
                      padding: EdgeInsets.all(5),

                      width:  sizeFromWidth(context, 1),
                      decoration:  BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: twoColor, //New
                              blurRadius: 10.0,
                              offset: Offset(0, 10))
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: sizeFromWidth(context, 4.5),
                            child: storyShape(
                              // context, white, NetworkImage((model.image)), 20, 22),
                                context, white, const NetworkImage('https://blog.libertylutheran.org/wp-content/uploads/2017/11/bigstock-Breakfast-Table-23302268.jpg'), 9, 10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Age :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text('Full Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Email :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text('Full Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Phone :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text('Full Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Gender :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text('Full Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 10),
                                child: Row(
                                  children:  [
                                    const Text('Full Name :   ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    Text('Full Name',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sizeFromHeight(context, 60),
                              ),

                            ],
                          ),
                          const SizedBox(height: 10,),

                        ],
                      ),
                    ),
                  ),
                ),
                
                //
                Padding(
                  padding: const EdgeInsets.only(left: 18.0,top: 10),
                  child:   Row(
                    children: [
                      Icon(Icons.history),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'History',
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ),
                ///user
                ConditionalBuilder(
                  //condition: true,
                  condition: AuthenticationCubit.get(context).foodSystemProfileUser.isNotEmpty,
                  builder: (context) =>  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildFoodUserItem(AuthenticationCubit.get(context).foodSystemProfileUser[index] ,context,index);
                    },
                    separatorBuilder: (context, index) => divider(10, 10, white),
                   itemCount: AuthenticationCubit.get(context).foodSystemProfileUser.length,
                   // itemCount: 15,
                  ),
                  fallback: (context) => Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: materialWidget(
                        context,
                        sizeFromHeight(context, 3, hasAppBar: true),
                        sizeFromWidth(context, 1),
                        20,
                        null,
                        BoxFit.fill,
                        [
                          textWidget(
                            'There are no Food System added',
                            null,
                            null,
                            mainColor,
                            sizeFromWidth(context, 20),
                            FontWeight.bold,
                          ),
                        ],
                        MainAxisAlignment.center,
                        false,
                        10,
                        totoColor,
                            () {},
                      ),
                    ),
                  ),
                ),

                //
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      AuthenticationCubit.get(context).logout(context);
                    },
                    focusColor: Colors.white,
                    highlightColor: Colors.white,
                    hoverColor: Colors.white,
                    child: Container(
                        width: sizeFromWidth(context, 1.3),
                        height: sizeFromHeight(context, 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: totoColor,
                          // border: Border.all(color: Colors.green, width: 1.5),

                        ),
                        padding: const EdgeInsets.all(10.0),
                        child: const Center(child: Text('Log Out',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
                  ),
                ),
                const SizedBox(height: 100,),
              ],
            ),
          );
        },
      ),
    );

  }
}

Widget buildFoodItemSystem(FoodSystemModel model, context,index) {
  return InkWell(
    onTap: (){
      navigateTo(context, DeteilsFoodSystem(model));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 10,right: 15,left: 15,bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(5),

        width:  sizeFromWidth(context, 1),
        decoration:  BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: twoColor, //New
                blurRadius: 10.0,
                offset: Offset(0, 10))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: sizeFromWidth(context, 1.65),
                child:  Row(
                  children: [
                    Text(
                      'Code: ',
                      style: TextStyle(
                        fontSize: 19.0,

                        color: totoColor,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${model.code}',
                      style: const TextStyle(
                        fontSize: 19.0,

                        color: Colors.blue,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: sizeFromWidth(context, 1.65),
                child:  Row(
                  children: [
                    Text(
                      'Weight :  ',
                      style: TextStyle(
                        fontSize: 19.0,

                        color: totoColor,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${model.fromWeight} to ${model.toWeight}' ,
                      style: const TextStyle(
                        fontSize: 19.0,

                        color: Colors.blue,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

}

Widget buildFoodUserItem(FoodSystemUserModel model, context,index) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0,right: 15,left: 15),
    child: Container(
      padding: EdgeInsets.all(5),

      width:  sizeFromWidth(context, 1),
      decoration:  BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: twoColor, //New
              blurRadius: 10.0,
              offset: Offset(0, 10))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Text(model.data,style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900,color: totoColor),),),
                   Padding(
                    padding: EdgeInsets.only(left: 18.0,top: 10),
                    child: Text('Basic measurements :',style: TextStyle(fontSize: sizeFromWidth(context, 17), fontWeight: FontWeight.w900,color: totoColor),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Age: ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.age,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Gender : ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.gender,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Height: ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.height,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10,),
                        child: Row(
                          children:  [
                             Text('Weight: ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.weight,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),

                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: sizeFromWidth(context, 3),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 10),
                          child: Row(
                            children:  [
                               Text('BMI: ',style: TextStyle(fontSize:sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                              Text(model.bmi,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text('Analytical measurements :',style: TextStyle(fontSize:sizeFromWidth(context, 17), fontWeight: FontWeight.w900,color: totoColor),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Fat: ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.fat,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Water: ',style: TextStyle(fontSize:sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.water,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Muscle: ',style: TextStyle(fontSize:sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.muscle,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 10),
                        child: Row(
                          children:  [
                             Text('Bone: ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                            Text(model.bone,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        width: sizeFromWidth(context, 3.2),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 10),
                          child: Row(
                            children:  [
                               Text('BMR: ',style: TextStyle(fontSize: sizeFromWidth(context, 21.5), fontWeight: FontWeight.w900),),
                              Text(model.bmr,style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900 ,color: Colors.blue),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width:  sizeFromWidth(context, 1),
                  decoration:  BoxDecoration(
                    color: totoColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // image: DecorationImage(
                    //   image: image ?? const AssetImage('assets/images/logo.png'),
                    //
                    // ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 10.0,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.fastfood),
                            textWidget(
                              'breakfast',
                              TextDirection.rtl,
                              null,
                              Colors.black87,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: totoColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            textWidget(
                              model.breakfast,
                              TextDirection.rtl,
                              null,
                              white,
                              sizeFromWidth(context, 25),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width:  sizeFromWidth(context, 1),
                  decoration:  BoxDecoration(
                    color: totoColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // image: DecorationImage(
                    //   image: image ?? const AssetImage('assets/images/logo.png'),
                    //
                    // ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 10.0,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.lunch_dining),
                            textWidget(
                              'lunch',
                              TextDirection.rtl,
                              null,
                              Colors.black87,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: totoColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            textWidget(
                              model.lunch,
                              TextDirection.rtl,
                              null,
                              white,
                              sizeFromWidth(context, 25),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width:  sizeFromWidth(context, 1),
                  decoration:  BoxDecoration(
                    color: totoColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // image: DecorationImage(
                    //   image: image ?? const AssetImage('assets/images/logo.png'),
                    //
                    // ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 10.0,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.dinner_dining),
                            textWidget(
                              'dinner',
                              TextDirection.rtl,
                              null,
                              Colors.black87,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: totoColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            textWidget(
                              model.dinner,
                              TextDirection.rtl,
                              null,
                              white,
                              sizeFromWidth(context, 25),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width:  sizeFromWidth(context, 1),
                  decoration:  BoxDecoration(
                    color: totoColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // image: DecorationImage(
                    //   image: image ?? const AssetImage('assets/images/logo.png'),
                    //
                    // ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 10.0,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.food_bank_sharp),
                            textWidget(
                              'Extra meal',
                              TextDirection.rtl,
                              null,
                              Colors.black87,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: totoColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            textWidget(
                              model.extraMeal,
                              TextDirection.rtl,
                              null,
                              white,
                              sizeFromWidth(context, 25),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width:  sizeFromWidth(context, 1),
                  decoration:  BoxDecoration(
                    color: totoColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // image: DecorationImage(
                    //   image: image ?? const AssetImage('assets/images/logo.png'),
                    //
                    // ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 10.0,
                          offset: Offset(0, 10))
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.food_bank_sharp),
                            textWidget(
                              'Notice',
                              TextDirection.rtl,
                              null,
                              Colors.black87,
                              sizeFromWidth(context, 20),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: totoColor,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            textWidget(
                              model.notice,
                              TextDirection.rtl,
                              null,
                              white,
                              sizeFromWidth(context, 25),
                              FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                AuthenticationCubit.get(context).deleteFoodSystemUser(model.id);
              },
              focusColor: Colors.white,
              highlightColor: Colors.white,
              hoverColor: Colors.white,
              child: Container(
                  width: sizeFromWidth(context, 1.3),
                  height: sizeFromHeight(context, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: totoColor,
                    // border: Border.all(color: Colors.green, width: 1.5),

                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Center(child: Text('Delete',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
            ),
          ),
        ],
      ),
    ),
  );

}