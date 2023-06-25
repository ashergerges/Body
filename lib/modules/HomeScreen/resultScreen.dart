import 'package:body/models/FoodSystemUserModel.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';
import 'package:body/shared/Components.dart';
import 'package:body/shared/Style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/FoodSystemModel.dart';

class ResultScreen extends StatelessWidget {
  List<FoodSystemUserModel> foodSystemResult ;
   ResultScreen(this.foodSystemResult,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(

            backgroundColor: white,
            appBar:AppBar(
              leading: IconButton(
                onPressed: () {
                  navigatePop(context);
                },
                icon:  Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Icon(Icons.arrow_back_ios_new,color: totoColor,size: 30),
                ),
              ),
              backgroundColor: white,
              elevation: 0,
              title: Text('Result',style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w900,color: totoColor),),
              centerTitle: true,
            ) ,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [

                  ConditionalBuilder(
                    condition:foodSystemResult.isNotEmpty,
                    builder: (context)=> ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        //return buildFoodUserItem(AuthenticationCubit.get(context).foodSystem[index] ,context,index);
                        return buildFoodUserItem(foodSystemResult[index],context, index);

                      },
                      separatorBuilder: (context, index) =>
                          divider(10, 10, white),

                      itemCount: foodSystemResult.length,

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
                  const SizedBox(height: 80,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
Widget buildFoodUserItem(FoodSystemUserModel model, context,index)
{
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
                AuthenticationCubit.get(context).sendResult(model: model,context:context );
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
                  child: const Center(child: Text('ok',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
            ),
          ),
        ],
      ),
    ),
  );

}