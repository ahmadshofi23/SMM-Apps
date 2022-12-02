import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smm_apps/core/utils/Colors.dart';
import 'package:smm_apps/core/utils/common.dart';
import 'package:smm_apps/feature/home/presentation/ui/home_screen.dart';
import 'package:smm_apps/feature/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../product/presentation/ui/search_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _namedRoutes = Modular.get<NameRoutes>();
  bool _obscureText = true;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void _showHidePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _navigateToHome(BuildContext context) {
    // username.clear();
    // password.clear();

    BlocProvider.of<LoginBloc>(context)
        .add(LoggedIn(username: username.text, password: password.text));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(top: 80.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 142.h,
                      width: 163.w,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 64.h),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.sp,
                        color: AppColor().kBlackColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.h,
                      vertical: 20.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor().kBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.sp),
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Masukan email anda',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor().kBlackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColor().kBlackColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: _showHidePassword,
                                icon: Icon(_obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Masukan password anda',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColor().kBlackColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontFamily: GoogleFonts.manrope().fontFamily,
                              fontSize: 12.sp,
                              color: AppColor().kGreyColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 29.h),
                        SizedBox(
                          width: double.infinity,
                          height: 50.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColor().kOrangeColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              // Modular.to.pushReplacementNamed(
                              //   '${_namedRoutes.loginScreen}${_namedRoutes.mainProdcutScreen}',
                              // );
                              _navigateToHome(context);
                              // BlocProvider.of<LoginBloc>(context).add(LoggedIn(
                              //     username: username.text,
                              //     password: password.text));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const SearchScreen()));
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: AppColor().kWhiteColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
