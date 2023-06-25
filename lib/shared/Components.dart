// ignore_for_file: constant_identifier_names


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:body/shared/Style.dart';






void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
  );
}

void navigatePop(BuildContext context) {
  Navigator.pop(context);
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) {
      return false;
    },
  );
}

Widget divider(double start, double end, Color color) {
  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: start,
      end: end,
    ),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: color,
    ),
  );
}

CircularProgressIndicator circularProgressIndicator(
  Color backgroundColor,
  Color colorWidget,
) {
  return CircularProgressIndicator(
    backgroundColor: backgroundColor,
    color: colorWidget,
    strokeWidth: 5,
  );
}

Text textWidget(String text, TextDirection? textDirection, TextAlign? textAlign,
    Color textColor, double? fontSize, FontWeight? fontWeight,
    [int? line]) {
  return Text(
    text,
    textDirection: textDirection,
    textAlign: textAlign,
    maxLines: line,
    style: TextStyle(
        decoration: TextDecoration.none,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text textWidgetChat(
    String text,
    TextDirection? textDirection,
    TextAlign? textAlign,
    Color textColor,
    double? fontSize,
    FontWeight? fontWeight,
    int line) {
  return Text(
    text,
    textDirection: textDirection,
    textAlign: textAlign,
    maxLines: line,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
        decoration: TextDecoration.none,
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

TextButton textButton(
    BuildContext context,
    String text,
    Color overlayColor,
    Color textColor,
    double fontSize,
    FontWeight fontWeight,
    VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(overlayColor),
      backgroundColor: MaterialStateProperty.all(overlayColor),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
  );
}

FloatingActionButton floatTextButton(
    String hero,
    Widget? icon,
    Color colorButton,
    Color textColor,
    double fontSize,
    FontWeight fontWeight,
    String text,
    VoidCallback onTab) {
  return FloatingActionButton.extended(
    elevation: 0,
    icon: icon,
    backgroundColor: colorButton,
    hoverColor: colorButton,
    focusColor: colorButton,
    foregroundColor: colorButton,
    splashColor: colorButton,
    highlightElevation: 0,
    onPressed: onTab,
    label: Text(
      text,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
    heroTag: hero,
  );
}

MaterialButton materialButtonIcon(
  BuildContext context,
  IconData icon,
  double iconSize,
  Color iconColor,
  Color highlightColor,
  VoidCallback onPressed,
) {
  return MaterialButton(
    onPressed: onPressed,

    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,

    child: Icon(
      icon,
      size: iconSize,
      color: iconColor,
    ),
  );
}

Material materialWidget(
    BuildContext context,
    double? childSizeHeight,
    double? childSizeWidth,
    double radius,
    ImageProvider? image,
    BoxFit fit,
    List<Widget> child,
    MainAxisAlignment mainAxisAlignment,
    bool boxExist,
    double? padding,
    Color? background,
    VoidCallback onPressed,
    [CrossAxisAlignment? crossAxisAlignment]) {
  return Material(
    borderRadius: BorderRadius.circular(radius),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(padding ?? 0),
        height: childSizeHeight,
        width: childSizeWidth,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          // image: DecorationImage(
          //   image: image ?? const AssetImage('assets/images/logo.png'),
          //
          // ),
          boxShadow: boxExist
              ? [
                  BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 2,
                      offset: const Offset(0, 1),
                      color: darkGrey),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment != null
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: child,
        ),
      ),
    ),
  );
}

Widget textFormField({
  TextEditingController? controller,
  required TextInputType type,
  required String? Function(String?)? validate,
  required String hint,
  bool isSecure = false,
  Function(String?)? onSave,
  Function(String?)? onChange,
  Function()? onTap,
  Widget? suffixIcon,
  bool isExpanded = false,
  bool fromLTR = false,
  int maxLines = 1,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5, horizontal: isExpanded ? 0 : 20),
    child: Directionality(
      textDirection: fromLTR ? TextDirection.ltr : TextDirection.ltr,
      child: TextFormField(
        onTap: onTap,
        keyboardType: type,
        onChanged: onChange,
        onSaved: onSave,
        maxLines: maxLines,
        controller: controller,
        validator: validate,
        obscureText: isSecure,
        autocorrect: false,
        enableSuggestions: false,
        textCapitalization: TextCapitalization.none,
        textAlignVertical: TextAlignVertical.center,
        cursorColor: totoColor,

        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hint,

          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: totoColor,

          ),
          filled: true,
          fillColor: white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: mainColor),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: totoColor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    ),
  );
}

Widget buildListTile(
    BuildContext ctx, String title, IconData icon, VoidCallback tapHandler) {
  return Directionality(
    textDirection: TextDirection.ltr,
    child: ListTile(
      leading: Icon(
        icon,
        color: petroleum,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: petroleum,
          fontSize: sizeFromWidth(ctx, 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    ),
  );
}

CircleAvatar storyShape(
  BuildContext context,
  Color background,
  ImageProvider? backgroundImage,
  double radius1,
  double radius2,
) {
  return CircleAvatar(
    radius: sizeFromHeight(context, radius1),
    backgroundColor: background,
    child: CircleAvatar(
      radius: sizeFromHeight(context, radius2),
      backgroundColor: white,
      backgroundImage: backgroundImage,
    ),
  );
}

CircularPercentIndicator percentIndicator(
    BuildContext context, double value, Color background) {
  return CircularPercentIndicator(
    circularStrokeCap: CircularStrokeCap.round,
    radius: sizeFromWidth(context, 13),
    percent: value,
    center: Text('${value * 100}%',
        style: TextStyle(color: totoColor, fontWeight: FontWeight.w500)),
    backgroundColor: background,
    progressColor: totoColor,
    curve: Curves.ease,
  );
}

////////////////////////////////////////////////////////
Widget defaultButton({
  required double width,
  required double height,
  required Color background,
  required Color border,
  Color highlightColor = Colors.grey,
  //required VoidCallback  function,
  required Function? function(),
  required String text,
  required Color textColor,
  bool isUpper = false,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: background,
        border: Border.all(color: border, width: 1.5),
      ),
      child: MaterialButton(
        highlightColor: highlightColor,
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: textColor,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController emailAddress,
  required String text,
  required String returnSyntex,
  required Widget prefixicon,
  required TextInputType keyboardtype,
  Function onsubmitt(value)?,
  Function onchange(value)?,
  bool ispassword = false,
  Icon? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return returnSyntex;
        } else if (value.length < 7) {
          return 'password must be at least 8 characters';
        }
        return null;
      },
      controller: emailAddress,
      decoration: InputDecoration(
        labelText: text,

//border: InputBorder.none,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),
        prefixIcon: prefixicon,

        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: suffix,

              )
            : null,
      ),
      keyboardType: keyboardtype,
      onFieldSubmitted: onsubmitt,
      onChanged: onchange,
      obscureText: ispassword,
    );
//////////////////////////////////////////////////////////////////////////
Widget defaultFormDataField({
  required TextEditingController emailAddress,
  required String text,
  required String returnSyntex,
  required Widget prefixicon,
  required TextInputType keyboardtype,
  Function onsubmitt(value)?,
  Function onchange(value)?,
  bool ispassword = false,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return returnSyntex;
        } else if (value!.length < 7) {
          return 'password must be at least 8 characters';
        }
      },
      controller: emailAddress,
      decoration: InputDecoration(
        labelText: text,

//border: InputBorder.none,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(17.0)),
        prefixIcon: prefixicon,

        suffixIcon: suffix != null
            ? IconButton(
          onPressed: () {
            suffixPressed!();
          },
          icon: Icon(
            suffix,
          ),
        )
            : null,
      ),
      keyboardType: keyboardtype,
      onFieldSubmitted: onsubmitt,
      onChanged: onchange,
      obscureText: ispassword,
    );
//////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////

////////////////////////////////////
Widget AnimatedBar({
  required bool isActive,

}) => AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 2),
      duration: const Duration(milliseconds: 200),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
          color: Color(0xFF81B4FF),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
    );



Widget InfoCard({
  required String name, bio,image

}) => ListTile(
  leading: Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
      ),
    ),
  ),
  // CircleAvatar(
  //   backgroundColor: Colors.white24,
  //   radius: 30.0,
  //   child: Image.asset(image,width: 500,height: 1000,fit: BoxFit.cover),
  // ),
  title: Text(
    name,
    style: const TextStyle(color: Colors.white),
  ),
  subtitle: Text(
    bio,
    style: const TextStyle(color: Colors.white70),
  ),
);


/////////////////////////////
Widget CustomPositioned({
    double scale=1,
   required Widget child,
}) => Positioned.fill(
  child: Column(
    children: [
      const Spacer(),
      SizedBox(
        height: 100,
        width: 100,
        child: Transform.scale(
          scale: scale,
          child: child,
        ),
      ),
      const Spacer(flex: 2),
    ],
  ),
);
////////////////////////////////About us////////////////////////////////////

Widget AboutUS({
  required String name,
  required String assets,

}) =>  Padding(
  padding: const EdgeInsets.only(right: 40.0),
  child:   Column(
    children: [
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 160,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.blueGrey[200],
            ),

          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 5,
                start: 10),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Image(image:
              AssetImage(assets,)
              ),
            ),
          ),
        ],

      ),
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        width: 150,
        height: 40,
        child: Text(name,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w900
          ),
        ),
      )
    ],
  ),
);

Widget OurValue({
  required String name,
  required String assets,

}) =>   Row(

  children: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 70,
        width: 70,
        child: Image(image:
        AssetImage(assets,)
        ),
      ),
    ),
    Text(name,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900
      ),
    ),

  ],
);
////////////////////////////////////////
// Future launchEmail({
//   required String toEmail,
//   String subject="",
//   String body="",
// }) async{
//   final url='mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
//   if (await canLaunchUrl(Uri)) {
//     await launchUrl(url as Uri);
//   }
// }

