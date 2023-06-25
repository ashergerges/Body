import 'package:body/shared/Components.dart';
import 'package:flutter/material.dart';
import 'package:body/modules/Authentication/login.dart';
import 'package:body/modules/Authentication/register.dart';
import 'package:body/shared/Style.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: sizeFromHeight(context, 15.9)),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Welcome in Slim Shape",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:  EdgeInsets.only(left:sizeFromWidth(context, 16.5),right:sizeFromWidth(context, 18) ),
                child:  Text(
                  "Welcome in slim Shape app  We wish you good ",
                  style: TextStyle(
                      fontSize: sizeFromWidth(context, 27),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),
              SizedBox(height: sizeFromHeight(context, 40),),
              Padding(
                padding:  EdgeInsets.only(left:sizeFromWidth(context, 16.5),right:sizeFromWidth(context, 18) ),
                child:  Text(
                  "health and always healthy eating ",
                  style: TextStyle(
                      fontSize: sizeFromWidth(context, 27),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset("assets/images/logo.png"),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );

                  },
                  focusColor: Colors.white,
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  child: Container(
                      width: sizeFromWidth(context, 1.3),
                      height: sizeFromHeight(context, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color:mainColor,
                        // border: Border.all(color: Colors.green, width: 1.5),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey, //New
                              blurRadius: 10.0,
                              offset: Offset(0, 10))
                        ],
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: const Center(child: Text('Login',style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );

                  },
                  focusColor: Colors.white,
                  highlightColor: Colors.white,
                  hoverColor: Colors.white,
                  child: Container(
                      width: sizeFromWidth(context, 1.3),
                      height: sizeFromHeight(context, 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: const Color(0xFFE95068),
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
              const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
