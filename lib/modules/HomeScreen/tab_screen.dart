
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:body/modules/Authentication/cubit/cubit.dart';
import 'package:body/modules/Authentication/cubit/states.dart';
import 'package:body/shared/Style.dart';




class TabScreen extends StatelessWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     // create: (BuildContext context) => AuthenticationCubit()..getUid(),
      create: (BuildContext context) => AuthenticationCubit(),
      child: BlocConsumer<AuthenticationCubit, AuthenticationStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {

          var cubit=AuthenticationCubit.get(context);
          return Scaffold(
            backgroundColor: white,
            body:cubit.screen[cubit.currentIndex],
            extendBody: true,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: mainColor
                  // border: Border.all(color: Colors.green, width: 1.5),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BottomNavigationBar(
                    iconSize: 30,
                    elevation: 0,
                    backgroundColor:mainColor,
                    items: const [
                      BottomNavigationBarItem(
                        icon:Icon(Icons.home,),
                        label:'Home',
                      ),
                      BottomNavigationBarItem(
                        icon:Icon(Icons.fastfood_rounded,),
                        label:'Meal',
                      ),
                      BottomNavigationBarItem(
                        icon:Icon(Icons.person,),
                        label:'Profile',
                      ),
                    ],
                    currentIndex:cubit.currentIndex,
                    onTap: (index){
                      cubit.changePage(index);
                    },

                  ),
                ),
              ),
            )
          );
        },
      ),
    );

  }
}
