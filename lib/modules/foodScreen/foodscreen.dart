import 'package:body/models/MealModel.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';
import 'package:body/shared/Components.dart';
import 'package:body/shared/Style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationCubit()..getMeals()..getUid(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AuthenticationCubit.get(context).id==systemId?Padding(
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
                        Row(

                          children: [
                            CircleAvatar(
                             radius: sizeFromWidth(context, 9),
                             // radius:50,
                              child: storyShape(
                                // context, white, NetworkImage((model.image)), 20, 22),
                                  context, white, const NetworkImage('https://blog.libertylutheran.org/wp-content/uploads/2017/11/bigstock-Breakfast-Table-23302268.jpg'), 15, 12),
                            ),
                            Form(
                              key: AuthenticationCubit.get(context).formKeyMeal,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(sizeFromWidth(context, 29)),

                                    child: Container(
                                      width: sizeFromWidth(context,  1.7),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Meal or Drinks can not empty';
                                          }
                                          return null;
                                        },
                                        controller: AuthenticationCubit.get(context).meal,
                                        decoration: InputDecoration(
                                          labelText: 'Meal or Drinks',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(17.0)),
                                          prefixIcon:  Icon(
                                            Icons.no_meals,
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
                                    padding:  EdgeInsets.all(sizeFromWidth(context, 29)),
                                    child: Container(
                                      width: sizeFromWidth(context, 1.7),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'calories can not empty';
                                          }
                                          return null;
                                        },
                                        controller: AuthenticationCubit.get(context).calories,
                                        decoration: InputDecoration(
                                          labelText: 'calories',
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(17.0)),
                                          prefixIcon:  Icon(
                                            Icons.confirmation_number_sharp,
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
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: (){
                              if (AuthenticationCubit.get(context).formKeyMeal.currentState!.validate())
                              {
                                AuthenticationCubit.get(context).addMeal(
                                  caloriess: AuthenticationCubit.get(context)
                                      .calories
                                      .text
                                      .trim(),
                                  meall: AuthenticationCubit.get(context)
                                      .meal
                                      .text
                                      .trim(),
                                );
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
                                child: const Center(child: Text('Add Meal',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ):Center(),
                AuthenticationCubit.get(context).id==systemId?SizedBox(height: 10,):SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: textFormField(
                      controller:AuthenticationCubit.get(context).searchMealController,
                      type: TextInputType.text,
                      validate: (value) {
                        return null;
                      },
                      hint: "    Search .....",
                      isExpanded: true,
                      fromLTR: false,
                      onTap: () {
                        AuthenticationCubit.get(context).getMeals();
                      },
                      onChange: (value) {
                        if (AuthenticationCubit.get(context).searchMealController.text ==
                            '' || AuthenticationCubit.get(context).meals.isEmpty) {
                          AuthenticationCubit.get(context).getMeals();
                        }
                        AuthenticationCubit.get(context).searchAboutMeals(value);


                      }),
                ),
                ConditionalBuilder(
                  // condition: true,
                  condition: AuthenticationCubit.get(context).meals.isNotEmpty,
                  builder: (context) =>  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildGameItem(AuthenticationCubit.get(context).meals[index] ,context,index);
                    },
                    separatorBuilder: (context, index) =>
                        divider(10, 10, white),

                    itemCount: AuthenticationCubit.get(context).meals.length,
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
                            'There are no meals added',
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

              ],
            ) ,
          );
        },
      ),
    );

  }
}
Widget buildGameItem(MealModel model, context,index){
  if(AuthenticationCubit.get(context).id==systemId){
    return Dismissible(
      background: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.delete),
      ),
      secondaryBackground: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Sure Delete"),
              content: const Text(
                  "Do You Want Delete this Hotels"),
              actions: <Widget>[

                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Cancel",style: TextStyle(color: const Color(0xff1a033b))),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),

                  child: const Text("Delete",style: TextStyle(color: const Color(0xff1a033b)),),

                ),
              ],
            );
          },
        );
      },
      onDismissed: (_) {
        AuthenticationCubit.get(context).deleteMeals(model.id);

      },
      key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.only(top: 10,right: 15,left: 15,bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(5),

          width:  sizeFromWidth(context, 1.1),
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
              Row(

                children: [
                  CircleAvatar(
                    radius: sizeFromWidth(context, 9),
                    child: storyShape(
                      // context, white, NetworkImage((model.image)), 20, 22),
                        context, white, const NetworkImage('https://blog.libertylutheran.org/wp-content/uploads/2017/11/bigstock-Breakfast-Table-23302268.jpg'), 15, 12),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: sizeFromWidth(context, 1.9),
                          child:  Row(
                            children: [
                              Text(
                                'Name: ',
                                style: TextStyle(
                                  fontSize: 19.0,

                                  color: totoColor,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                model.name,
                                style: TextStyle(
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
                      Padding(
                        padding:  EdgeInsets.all(sizeFromWidth(context, 35),),
                        child: Row(
                          children: [
                            Text(
                              'calories in 100 gram :  ',
                              style: TextStyle(
                                fontSize: sizeFromWidth(context, 22),

                                color: totoColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 4,),
                            Text(
                              model.calories,
                              style: TextStyle(
                                fontSize: sizeFromWidth(context, 22),

                                color: Colors.blue,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding:  EdgeInsets.all(sizeFromWidth(context, 35),),
                      //   child: Container(
                      //     width: sizeFromWidth(context, 2),
                      //     child:
                      //   ),
                      // ),
                    ],
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
  else{
    return  Padding(
      padding: const EdgeInsets.only(top: 10,right: 15,left: 15,bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(5),

        width:  sizeFromWidth(context, 1.1),
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
            Row(

              children: [
                CircleAvatar(
                  radius: sizeFromWidth(context, 9),
                  child: storyShape(
                    // context, white, NetworkImage((model.image)), 20, 22),
                      context, white, const NetworkImage('https://blog.libertylutheran.org/wp-content/uploads/2017/11/bigstock-Breakfast-Table-23302268.jpg'), 15, 12),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: sizeFromWidth(context, 1.9),
                        child:  Row(
                          children: [
                            Text(
                              'Name: ',
                              style: TextStyle(
                                fontSize: 19.0,

                                color: totoColor,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              model.name,
                              style: TextStyle(
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
                    Padding(
                      padding:  EdgeInsets.all(sizeFromWidth(context, 35),),
                      child: Row(
                        children: [
                          Text(
                            'calories in 100 gram :  ',
                            style: TextStyle(
                              fontSize: sizeFromWidth(context, 22),

                              color: totoColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 4,),
                          Text(
                            model.calories,
                            style: TextStyle(
                              fontSize: sizeFromWidth(context, 22),

                              color: Colors.blue,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding:  EdgeInsets.all(sizeFromWidth(context, 35),),
                    //   child: Container(
                    //     width: sizeFromWidth(context, 2),
                    //     child:
                    //   ),
                    // ),
                  ],
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }

}