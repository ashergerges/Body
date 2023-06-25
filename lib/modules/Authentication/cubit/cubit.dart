import 'dart:io';
import 'package:body/models/FoodSystemModel.dart';
import 'package:body/models/FoodSystemUserModel.dart';
import 'package:body/models/MealModel.dart';
import 'package:body/modules/HomeScreen/resultScreen.dart';
import 'package:body/modules/foodScreen/foodscreen.dart';
import 'package:body/modules/profileScreen/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:body/models/UserModel.dart';
import 'package:body/modules/Authentication/AuthScreen.dart';
import 'package:body/modules/Authentication/cubit/states.dart';

import 'package:body/modules/HomeScreen/tab_screen.dart';
import 'package:body/shared/Components.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:body/shared/Style.dart';

import '../../HomeScreen/home_Screen.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates>
{
  AuthenticationCubit() : super(AuthenticationInitialState());

  static  AuthenticationCubit get(contex) =>BlocProvider.of(contex);

   Icon suffix=  Icon(Icons.visibility_outlined,color: mainColor,);
   bool isPassword = true;

  void changePasswordVisibility()
   {
     isPassword = !isPassword;
     suffix = isPassword?const Icon(Icons.visibility_outlined,color: Color(0xFFF77D8E),): const Icon(Icons.visibility_off_outlined,color: Color(0xFFF77D8E),);

     emit(LoginChangePasswordVisibilityState(),);

   }
   ///////////////////////////
  String startDate = '';
  void selectStartDatePerDay(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2, 3, 5),
      maxTime: DateTime(3500, 6, 7),
      onChanged: (date) {
        startDate = DateFormat.yMMMd().format(date).toString();
        emit(SelectDatePerDayState());
      },
      onConfirm: (date) {
        startDate = DateFormat.yMMMd().format(date).toString();
        emit(SelectDatePerDayState());
      },
      currentTime: DateTime.now(),
    );
  }
  String endDate = '';
  void selectEndDatePerDay(BuildContext context) {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime(2, 3, 5),
      maxTime: DateTime(3500, 6, 7),
      onChanged: (date) {
        endDate = DateFormat.yMMMd().format(date).toString();
        emit(SelectDatePerDayState());
      },
      onConfirm: (date) {
        endDate = DateFormat.yMMMd().format(date).toString();
        emit(SelectDatePerDayState());
      },
      currentTime: DateTime.now(),
    );
  }
/// /////////////////////////////////////////////////////////////////

  int currentIndex=0;
  List<Widget>screen=[
    const HomeScreen(),
    const FoodScreen(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    if(index==0){
      id=FirebaseAuth.instance.currentUser!.uid.toString();
    //  getGame();
    }
    if(index==1){
     // getAppointment();
    }
    currentIndex = index;
    emit(TabChangeScreenState());
  }
  /// /////////////Serach/////////////////////
  // searchAboutHotels(value) {
  //   List<HotelModel> searchHotels = [];
  //   searchHotels = hotels.where((element) {
  //     var searchItem = element.name.toLowerCase()+ element.place.toLowerCase();
  //     return searchItem.contains(value.toString().toLowerCase());
  //   }).toList();
  //   hotels = [];
  //   hotels = searchHotels;
  //   emit(SearchAboutGameState());
  // }
  /// //////////////////////////////////////////////

  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyMeal = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyMeasurement = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyFoodSystem = GlobalKey<FormState>();
  var emailLogin = TextEditingController();
  var passwordLogin = TextEditingController();
  var commentController = TextEditingController();
  var reviewController = TextEditingController();
  var phoneSignUp = TextEditingController();
  var passwordSignUp = TextEditingController();
  var emailSignUp = TextEditingController();
  var nameSignUp = TextEditingController();
  var ageSignUp = TextEditingController();
  var genderSignUp = TextEditingController();
  var meal = TextEditingController();
  var calories = TextEditingController();
  var searchMealController = TextEditingController();
  var searchFoodSystemController = TextEditingController();
  ////////////////////postScreen////////////////////////////////
  File? postImage;
  String? imageUrl;
  String id='';
  // var picker = ImagePicker();
  // late final pickedFile;
  // Future<void> getPostImage() async {
  //    pickedFile = await picker.getImage(
  //     source: ImageSource.gallery,
  //   );
  //
  //   if (pickedFile != null) {
  //     postImage = File(pickedFile.path);
  //     emit(PostImagePickedSuccessState());
  //   } else {
  //     print('No image selected.');
  //     emit(PostImagePickedErrorState());
  //   }
  // }
  // Future<void> openPostImage() async {
  //   final pickedFile = await picker.getImage(
  //     source: ImageSource.camera,
  //   );
  //
  //   if (pickedFile != null) {
  //     postImage = File(pickedFile.path);
  //     emit(PostImagePickedSuccessState());
  //   } else {
  //     print('No image selected.');
  //     emit(PostImagePickedErrorState());
  //   }
  // }
  ////////////
  var picke = ImagePicker();
  File? updateImage;
  Future<void> getUpdateImage() async {
    final pickedFile = await picke.getImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      updateImage = File(pickedFile.path);
      emit(PostImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(PostImagePickedErrorState());
    }
    emit(PostImagePickedSuccessState());
  }
/////////////////////////////////////////////////////

/////////////////////////Update////////////////////////////


//////////////////////////////////////

  void userRegister({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
    required String phone,
    required String age,
    required String gender,

  }) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      id=FirebaseAuth.instance.currentUser!.uid.toString();
      createUser(
        email: email,
        name: name,
        password: password,
        phone: phone,
        uId: value.user!.uid,
        context: context,
        gender: gender,
        age: age,
      );
      emit(SignUPSuccessState());
    }).catchError((error) {
      showToast(text: error.toString(), state: ToastStates.ERROR);
      emit(SignUPErrorState(error.toString()));
    });
  }

  void createUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
    required String age,
    required String gender,
    required BuildContext context,
  }) async {
    emit(PickedImageLoadingState());
    FirebaseStorage.instance
        .ref()
        .child('userImage/$uId')
        .putFile(updateImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        imageUrl = value;
        UserModel model = UserModel(
          name: name,
          email: email,
          password: password,
          phone: phone,
          image: value,
          id: uId,
          age: age,
          gender: gender,
        );
        FirebaseFirestore.instance
            .collection('users')
            .doc(uId)
            .set(model.toMap());
          });
      navigateAndFinish(context, const TabScreen());
      emit(SignUPCreateUserSuccessState());
    })
        .catchError((error) {
      showToast(text: error.toString(), state: ToastStates.ERROR);
      emit(SignUPCreateUserErrorState(error.toString()));

    });
     emit(SignUPCreateSuccessState());
  }

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {


    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      id=FirebaseAuth.instance.currentUser!.uid.toString();
      navigateAndFinish(context, const TabScreen());
      emit(LoginSuccessState());
    }).catchError((error) {
      showToast(text: error.toString(), state: ToastStates.ERROR);
      emit(LoginErrorStateLog(error.toString()));

    });
  }

  void logout(BuildContext context){
    FirebaseAuth.instance.signOut().then((value){
      Navigator.push(context, MaterialPageRoute(builder: (c)=> const AuthScreen()));
    });
  }
  void getUid(){
    id=FirebaseAuth.instance.currentUser!.uid.toString();
    print(id);
    print('!!!!!!!!!');
    emit(LoginSuccessState());
  }
/////////////////////////////////
void addMeal({required String meall,required String caloriess,}){
  MealModel model = MealModel(
    name: meall,
    calories: caloriess,
    id: 'uId',
    createdAt: Timestamp.now().toString(),
  );
    FirebaseFirestore.instance
        .collection('meals')
        .add(model.toMap())
        .then((value) {
      calories.text='';
      meal.text='';
      FirebaseFirestore.instance
          .collection('meals')
          .doc(value.id)
          .update({
        'id':value.id,
      });
      getMeals();
      emit(BookUsersSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(BookUsersErrorState(error.toString()));
    });
    emit(BookUsersSuccessState());
  }
////////////////////////////////
  List<MealModel> meals = [];
  void getMeals() {
    FirebaseFirestore.instance
        .collection('meals')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      meals = [];
      for (var element in event.docs) {
        meals.add(MealModel.fromJson(element.data()));
      }
      emit(GetHotelsSuccessState());
    });
  }
  void deleteMeals(String id) {
    FirebaseFirestore.instance.collection('meals').doc(id).delete();
  }
////////////////////////////////
  searchAboutMeals(value) {
    List<MealModel> searchHotels = [];
    searchHotels = meals.where((element) {
      var searchItem = element.name.toLowerCase()+ element.calories.toLowerCase();
      return searchItem.contains(value.toString().toLowerCase());
    }).toList();
    meals = [];
    meals = searchHotels;
    emit(SearchAboutGameState());
  }
  searchAboutFoodSystem(value) {
    List<FoodSystemModel> searchHotels = [];
    searchHotels = foodSystem.where((element) {
      var searchItem = element.code.toString().toLowerCase()+ element.fromWeight.toString().toLowerCase()+ element.toWeight.toString().toLowerCase();
      return searchItem.contains(value.toString().toLowerCase());
    }).toList();
    foodSystem = [];
    foodSystem = searchHotels;
    emit(SearchAboutGameState());
  }

//////////////////////////////////Measurements/////////////////////////////////////////////////////////////////
  var measurementAge = TextEditingController();
  var measurementGender = TextEditingController();
  var measurementHeight = TextEditingController();
  var measurementWeight = TextEditingController();
  var measurementBMI = TextEditingController();
  var measurementFat = TextEditingController();
  var measurementWater = TextEditingController();
  var measurementMuscle = TextEditingController();
  var measurementBone = TextEditingController();
  var measurementBMR = TextEditingController();
////////////////////////////////////////////////////////////////////////
//void getResult({required double age,required double height,required double weight,required double BMI,}){
  List<FoodSystemUserModel> foodSystemResult = [];
  void getResult(BuildContext context){
  FirebaseFirestore.instance
      .collection('Food System')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .listen((event) {
    foodSystemResult = [];
    for (var element in event.docs) {
      print('///////////////////');
       if (element['fromWeight']<=int.parse(measurementWeight.text) &&int.parse(measurementWeight.text)<element['toWeight'])
       { print('///////@!@!@!@////////////');
         foodSystemResult.add(FoodSystemUserModel(
             weight: measurementWeight.text,
             gender: measurementGender.text,
             age: measurementAge.text,
             height: measurementHeight.text,
             bmi: measurementBMI.text,
             bmr: measurementBMR.text,
             bone: measurementBone.text,
             fat: measurementFat.text,
             muscle: measurementMuscle.text,
             water: measurementWater.text,
             breakfast: element['breakfast'],
             lunch: element['lunch'],
             dinner: element['dinner'],
             extraMeal: element['extraMeal'] ,
             notice: element['notice'] ,
             id: element['id'],
             createdAt:element['createdAt'] ,
             data: '',
         ));
       }
    }
    measurementAge.text ='';
    measurementGender.text ='';
    measurementHeight.text ='';
    measurementWeight.text ='';
    measurementBMI.text ='';
    measurementFat.text ='';
    measurementWater.text ='';
    measurementMuscle.text ='';
    measurementBone.text ='';
    measurementBMR.text ='';
    navigateTo(context,  ResultScreen(foodSystemResult));
    emit(GetHotelsSuccessState());
  });

}
///////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////FoodSystem/////////////////////////////////////////////////////////////////
  var foodSystemCode = TextEditingController();
  var foodSystemFromAge = TextEditingController();
  var foodSystemToAge = TextEditingController();
  var foodSystemBreakfast = TextEditingController();
  var foodSystemLunch = TextEditingController();
  var foodSystemDinner = TextEditingController();
  var foodSystemExtraMeal = TextEditingController();
  var foodSystemNotice = TextEditingController();
////////////////////////////////////////////////////////////////////////
void setFoodSystem(){
  FoodSystemModel model =FoodSystemModel(
      code: int.parse(foodSystemCode.text),
      fromWeight: int.parse(foodSystemFromAge.text),
      toWeight: int.parse(foodSystemToAge.text),
      breakfast: foodSystemBreakfast.text,
      lunch: foodSystemLunch.text,
      dinner: foodSystemDinner.text,
      extraMeal: foodSystemExtraMeal.text,
      notice: foodSystemNotice.text,
      id: '',
      createdAt: Timestamp.now().toString(),
  );
  FirebaseFirestore.instance
      .collection('Food System')
      .add(model.toMap())
      .then((value) {
    foodSystemFromAge.text='';
    foodSystemToAge.text='';
    foodSystemBreakfast.text='';
    foodSystemLunch.text='';
    foodSystemExtraMeal.text='';
    foodSystemDinner.text='';
    foodSystemCode.text='';
    foodSystemNotice.text='';
    FirebaseFirestore.instance
        .collection('Food System')
        .doc(value.id)
        .update({
      'id':value.id,
    });
    // getMeals();
    emit(FoodUsersSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(FoodErrorStateLog(error.toString()));
  });
  emit(FoodUsersSuccessState());
   }
  List<FoodSystemModel> foodSystem = [];
  void getFoodSystem() {
    FirebaseFirestore.instance
        .collection('Food System')
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((event) {
      foodSystem = [];
      for (var element in event.docs) {
        foodSystem.add(FoodSystemModel.fromJson(element.data()));
      }
      emit(GetHotelsSuccessState());
    });
  }
  void deleteFoodSystem(String id) {
    FirebaseFirestore.instance.collection('Food System').doc(id).delete();
  }
////////////////////////////////////////////////////////////////////////

  List<FoodSystemUserModel> foodSystemProfileUser = [];
  void getFoodSystemUser() {
    if(FirebaseAuth.instance.currentUser!.uid.toString()!=systemId)
    {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .collection('Food System')
          .orderBy('createdAt', descending: true)
          .snapshots()
          .listen((event) {
        foodSystemProfileUser = [];
        for (var element in event.docs) {
          foodSystemProfileUser.add(FoodSystemUserModel.fromJson(element.data()));
        }

      });
      emit(GetHotelsSuccessState());
    }

  }
  void deleteFoodSystemUser(String id) {
    FirebaseFirestore.instance.collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('Food System').doc(id).delete().then((value) {
          emit(GetHotelsSuccessState());
    });

  }
  ///////////////////////////////////////////////////////////////////////
  UserModel? modelProfile;
  void getProfile(){
    if(FirebaseAuth.instance.currentUser!.uid.toString()!=systemId){
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .get().then((value){

        modelProfile=UserModel(
          name : value['name'],
          email :value['email'],
          password : value['password'],
          phone :value['phone'],
          image : value['image'],
          id : value['id'],
          gender: value['gender'],
          age:value['age'],
        );
        emit(ProfileSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(ProfileErrorState(error.toString()));
      });
    }
    emit(ProfileSuccessState());
  }
////////////////////////////////////////////////////////////////////////
  void sendResult({
    required FoodSystemUserModel model,
    required BuildContext context,
}) {
    navigatePop(context);
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid.toString())
        .collection('Food System')
        .add(model.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid.toString())
          .collection('Food System')
          .doc(value.id)
          .update({
        'id':value.id,
        'createdAt':Timestamp.now().toString(),
        'data':DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
      });

    });
    emit(SendResultSuccessState());
  }
////////////////////////////////////////////////////////////////////////
}
