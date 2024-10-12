// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unused_local_variable

// import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:floating_bubbles/floating_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:minia_web_project/app.config.dart';
import 'package:minia_web_project/comman/app.input.dart';
import 'package:minia_web_project/comman/colors.dart';
import 'package:minia_web_project/controller/sidebar_controller.dart';
import 'package:minia_web_project/routes/pages.dart';
import 'package:minia_web_project/utility/app.assets.dart';
import 'package:minia_web_project/view/Authentication/pages/reset_pass.dart';
import '../../Menus/drawer.dart';
import '../controller/login.controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool valuefirst = false;

  //final LoginController controller = Get.find<LoginController>();
  final GlobalKey<FormState> rowFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> columnFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      // key: scaffoldKey,
      body: width > 750 ? row(context, height, width) : column(context, height),
    );
  }

  Form row(BuildContext context, double height, double width) {
    return Form(
      key: rowFormKey,
      child: Row(
        children: [
          Expanded(
              flex: width > 880
                  ? 1
                  : width > 750
                      ? 1
                      : 2,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    loginfileds(width),
                  ],
                ),
              )),
          Expanded(
            flex: width > 880
                ? 3
                : width > 750
                    ? 2
                    : 3,
            child: imageLogin(context),
          )
        ],
      ),
    );
  }


  SingleChildScrollView column(BuildContext context, double height) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Form(
        key: columnFormKey,
        child: Column(
          children: [
            loginfileds(height),
            imageLogin(context),
          ],
        ),
      ),
    );
  }

  Container loginfileds(height) {
    LoginController loginController = Get.find();
    return Container(
        // color: Colors.amber,
        // height: height > 670 ? height : 670,
        height: 900,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/image/logo.png", height: 100, width: 150,),
                  // LoginText(
                  //   color: AppColor.darkblack,
                  //   fontWeight: FontWeight.w800,
                  //   size: 20,
                  //   text: AppConfig.APP_NAME,
                  // ),
                ],
              ),
              Spacer(),
              LoginText(
                color: AppColor.dark,
                fontWeight: FontWeight.w700,
                size: 18,
                text: "Welcome Back !",
              ),
              Container(height: 8),
             Center(child: Text("Sign in to continue to ${AppConfig.APP_NAME}.",
              textAlign: TextAlign.center,
             )),
              Container(height: 35),
              Align(
                alignment: Alignment.centerLeft,
                child: LoginText(
                  text: "Email",
                  size: 14,
                  color: AppColor.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(height: 10),
              AppInput(
                hint: 'Enter email',
                obscure: false,
                controller: _email,
              ),
              Container(height: 17),
              Row(
                children: [
                  LoginText(
                    text: "Password",
                    size: 14,
                    color: AppColor.dark,
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(flex: 1),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: () => Get.to(() => ResetPassword()),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: LoginText(
                          text: "Forgot password?",
                          size: 14,
                          color: AppColor.lightgrey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 10),
              Container(
                height: 40,
                child: Obx(() => TextFormField(
                  controller: _pass,
                      obscureText: loginController.isShow.value,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.hintcolor,
                        fontWeight: FontWeight.w400,
                      ),
                      autocorrect: true,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            loginController.isShow.value =
                                !loginController.isShow.value;
                          },
                          child: Container(
                            color: AppColor.boxborder,
                            width: 50,
                            child: Icon(
                              loginController.isShow.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 18,
                              color: AppColor.black,
                            ),
                          ),
                        ),
                        isDense: true,
                        hintText: "Enter password",
                        hintStyle: TextStyle(
                            color: AppColor.hintcolor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        enabledBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide:
                              BorderSide(color: AppColor.borders, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          borderSide: BorderSide(color: AppColor.borders),
                        ),
                      ),
                    )),
              ),
              Container(height: 17),
              Row(
                children: [
                  Checkbox(
                    side: BorderSide(color: AppColor.hintcolor),
                    // activeColor: Colors.amber,
                    // overlayColor: MaterialStatePropertyAll(
                    //   AppColor.darkGreen,
                    // ),
                    fillColor: MaterialStatePropertyAll(
                      valuefirst == true
                          ? AppColor.selecteColor
                          : AppColor.mainbackground,
                    ),
                    value: valuefirst,
                    onChanged: (value) {
                      setState(() {
                        valuefirst = value!;
                      });
                    },
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: LoginText(
                      text: "Remember me",
                      size: 14,
                      color: AppColor.dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(height: 25),
              Obx((){
                  return InkWell(
                    onTap: () async{
                      //Get.toNamed(AppRoute.sidebar);
                      if(loginController.isLoading.value){
                        return null;
                      }else{
                        if(rowFormKey.currentState!.validate() || rowFormKey.currentState!.validate()){
                          loginController.adminLogin(_email.text, _pass.text);
                        }

                      }

                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              height: 38,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(color: AppColor.searchbackground),
                                ],
                                borderRadius: BorderRadius.circular(4),
                                color: AppColor.searchbackground,
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: loginController.isLoading.value ? CircularProgressIndicator.adaptive() : LoginText(
                                  text: "Log in",
                                  size: 14,
                                  color: AppColor.mainbackground,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ],
                    ),
                  );
                }
              ),
              Container(height: 40),

              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: LoginText(
                        text: "© 2024 ${AppConfig.APP_NAME}. Crafted with",
                        size: 14,
                        color: AppColor.dark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(width: 4),
                  Icon(
                    Icons.favorite,
                    size: 14,
                    color: AppColor.darkred,
                  ),
                  Container(width: 4),
                  Expanded(
                    flex: 3,
                    child: LoginText(
                      text: "by Nayon Coders",
                      size: 14,
                      color: AppColor.dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(height: 20),
            ],
          ),
        ));
  }
}


Stack imageLogin(BuildContext context) {
  return Stack(
    children: [
      Positioned.fill(
        child: Image.asset(
          "assets/image/banner.jpg",
          fit: BoxFit.cover,
        ),
      ),
      Positioned.fill(
        child: FloatingBubbles.alwaysRepeating(
          noOfBubbles: 10,
          colorsOfBubbles: [
            AppColor.lightgrey,
            AppColor.lightblue,
          ],
          sizeFactor: 0.05,
          opacity: 35,
          paintingStyle: PaintingStyle.fill,
          shape: BubbleShape.roundedRectangle,
          speed: BubbleSpeed.values[1],
        ),
      ),

    ],
  );
}

class LoginText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double size;

  const LoginText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      softWrap: false,
      // textAlign: TextAlign.left,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
