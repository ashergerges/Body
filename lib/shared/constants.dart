import 'package:flutter/animation.dart';

dynamic email;
String examId = '';
bool accountIsActive = false;
bool submitPayment = false;
late AnimationController animationController;
late Animation<double> scalAnimation;
late Animation<double> animation;
bool isAccess=false;
void changeaccess(){
  isAccess=true;
}
