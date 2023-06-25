import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';


import 'package:body/shared/Components.dart';
import 'package:body/shared/Style.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create: (BuildContext context) => AuthenticationCubit()..getUid(),
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body:SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0,right: 15,left: 15),
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
                              width: sizeFromWidth(context, 1),
                              child: Form(
                                key: AuthenticationCubit.get(context).formKeyMeasurement,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: Text('Hello',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900,color: totoColor),),),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 18.0,top: 10),
                                      child: Text('Basic measurements :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    ),
                                    SizedBox(
                                      width:  sizeFromWidth(context, 1),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.all(sizeFromWidth(context,50)),
                                            child: Container(
                                              width: sizeFromWidth(context, 3),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Age can not empty';
                                                  }
                                                  else if(int.parse(AuthenticationCubit.get(context).measurementAge.text)<18){
                                                    return 'Age is very short';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementAge,
                                                decoration: InputDecoration(
                                                  labelText: 'Age +18',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context,35),fontWeight:FontWeight.w900),

                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.date_range,
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
                                            padding:  EdgeInsets.only(top: sizeFromWidth(context, 30),right: sizeFromWidth(context, 40),bottom: sizeFromWidth(context, 30)),
                                            child: Container(
                                              width: sizeFromWidth(context, 2.1),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Gender can not empty';
                                                  }
                                                  else if(value!='male' && value!='female'){

                                                    return 'Gender male or female';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementGender,
                                                decoration: InputDecoration(
                                                  labelText: 'Gender male or female',
                                                  labelStyle: TextStyle(fontSize:sizeFromWidth(context, 45),fontWeight:FontWeight.w900),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.male_sharp,
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
                                    const SizedBox(height: 5,),
                                    SizedBox(
                                      width: sizeFromWidth(context, 1),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.all(sizeFromWidth(context, 50)),
                                            child: Container(
                                              width: sizeFromWidth(context, 3),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Height can not empty';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementHeight,
                                                decoration: InputDecoration(
                                                  labelText: 'Height Cm',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context, 45),fontWeight:FontWeight.w900),

                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.height,
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
                                            padding:  EdgeInsets.only(top: sizeFromWidth(context, 30),right: sizeFromWidth(context, 45),bottom:sizeFromWidth(context, 30)),
                                            child: Container(
                                              width: sizeFromWidth(context, 2.1),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Weight can not empty';
                                                  }
                                                  else if(int.parse(value)>300)
                                                  {
                                                    return 'Weight is so much';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementWeight,
                                                decoration: InputDecoration(
                                                  labelText: 'Weight at least 300Kg',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context, 39),fontWeight:FontWeight.w900),
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
                                    SizedBox(
                                      width: sizeFromWidth(context, 1),
                                      child: Center(
                                        child: Padding(
                                          padding:  EdgeInsets.all(sizeFromWidth(context, 30)),
                                          child: Container(
                                            width: sizeFromWidth(context, 2.5),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'BMI can not empty';
                                                }
                                                return null;
                                              },
                                              controller: AuthenticationCubit.get(context).measurementBMI,
                                              decoration: InputDecoration(
                                                labelText: 'BMI (21-24)',
                                                labelStyle: TextStyle(fontSize: sizeFromWidth(context,35),fontWeight:FontWeight.w900),

                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(17.0)),
                                                prefixIcon:  Icon(
                                                  Icons.factory_outlined,
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
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 18.0),
                                      child: Text('Analytical measurements :',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                                    ),
                                    SizedBox(
                                      width: sizeFromWidth(context, 1),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.all(sizeFromWidth(context, 50)),
                                            child: Container(
                                              width: sizeFromWidth(context, 2.5),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Fat can not empty';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementFat,
                                                decoration: InputDecoration(
                                                  labelText: 'Fat (11-22)',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context, 35),fontWeight:FontWeight.w900),

                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.description,
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
                                            padding:  EdgeInsets.all(sizeFromWidth(context, 50)),
                                            child: Container(
                                              width: sizeFromWidth(context, 2.5),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Water can not empty';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementWater,
                                                decoration: InputDecoration(
                                                  labelText: 'Water (52-57)',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context, 40),fontWeight:FontWeight.w900),

                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.water_drop_sharp,
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
                                    SizedBox(
                                      width: sizeFromWidth(context, 1),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:  EdgeInsets.all(sizeFromWidth(context, 50)),
                                            child: Container(
                                              width: sizeFromWidth(context, 2.5),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Muscle can not empty';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementMuscle,
                                                decoration: InputDecoration(
                                                  labelText: 'Muscle (30-45)',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context, 45),fontWeight:FontWeight.w900),

                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.multiline_chart_sharp,
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
                                            padding:  EdgeInsets.all(sizeFromWidth(context, 50)),
                                            child: Container(
                                              width: sizeFromWidth(context, 2.5),
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'Bone can not empty';
                                                  }
                                                  return null;
                                                },
                                                controller: AuthenticationCubit.get(context).measurementBone,
                                                decoration: InputDecoration(
                                                  labelText: 'Bone (1.7-3.6)Kg',
                                                  labelStyle: TextStyle(fontSize: sizeFromWidth(context, 50),fontWeight:FontWeight.w900),

                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(17.0)),
                                                  prefixIcon:  Icon(
                                                    Icons.perm_contact_calendar_sharp,
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
                                    SizedBox(
                                      width: sizeFromWidth(context, 1),
                                      child: Center(
                                        child: Padding(
                                          padding:  EdgeInsets.all(sizeFromWidth(context, 45)),
                                          child: Container(
                                            width: sizeFromWidth(context, 1.7),
                                            child: TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'BMR can not empty';
                                                }
                                                return null;
                                              },
                                              controller: AuthenticationCubit.get(context).measurementBMR,
                                              decoration: InputDecoration(
                                                labelText: 'BMR (1170-2440)Kcal',
                                                labelStyle: TextStyle(fontSize:sizeFromWidth(context, 35),fontWeight:FontWeight.w900),

                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(17.0)),
                                                prefixIcon:  Icon(
                                                  Icons.safety_check,
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
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  if (AuthenticationCubit.get(context).formKeyMeasurement.currentState!.validate())
                                  {
                                    AuthenticationCubit.get(context).getResult(context);
                                    showToast(
                                        text: 'Good Test',
                                        state: ToastStates.SUCCESS);
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
                                    child: const Center(child: Text('Check',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900,),))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 80.0,left: 10,right: 10),
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
                          boxShadow: const [
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
                              child: textWidget(
                                'Warning',
                                TextDirection.rtl,
                                null,
                                Colors.black87,
                                sizeFromWidth(context, 20),
                                FontWeight.bold,
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
                                    '١. تمارين اكثر لو زادت عضلاتك قوة بتمرينات التقوية لاصبحت تستهلك طاقه اكثر حتى في وقت الراحه\n ٢. نظم مواعيد نومك لتكون مساء في حدود ٦ ، ٨ ساعات\n ٣. تجنب التغيرات الحاده في السكر تجنب الاطعمه التي ترفع السكر سريعا في الدم لانها ينتج عنها ارتفاع سريع في الانسولين مما ينتج عنه ايضا انخفاض سريع في السكر مما يؤدي الى الجوع السريع\n ٤. اشرب الكثير من الماء كلما شعرت بالجوع فقد تكون عطشانا فقط مع مراعاه شرب كميه كبيره قبل كل وجبه\n ٥. تناول الطعام ببطء وتعود على ترك ادوات الطعام على الطاوله وليس في يدك\n ٦. توقف قبل ان تشبع اشارات الشبع تاخذ وقتا اطول مما تعتقد لتصل الى مخك \n ٧. توقف قبل ان تشبع اشارات الشبع تاخذ وقتا اطول مما تعتقد لتصل الى مخك \n٨. ممنوع مشاهده التليفزيون او النوم اثناء الاكل \n ٩. ممنوع النوم قبل ساعتين من الاكل',
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
                    const SizedBox(height: 100,),
                  ],
                ),
              ),
          );
        },
      ),
    );
  }

}
