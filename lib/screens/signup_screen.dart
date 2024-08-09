import 'package:firebase_auth_app/constants/app_strings.dart';
import 'package:firebase_auth_app/firebase-auth/firebase_auth_services.dart';
import 'package:firebase_auth_app/route/routes.dart';
import 'package:firebase_auth_app/wigdets/custom_button.dart';
import 'package:firebase_auth_app/wigdets/custom_input.dart';
import 'package:firebase_auth_app/wigdets/custom_space.dart';
import 'package:firebase_auth_app/wigdets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final arrowLeft = 'assets/icons/arrow-left.svg';
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void signUp({required String userEmail, required String userPassword}) async {
    setState(() {
      isLoading = !isLoading;
    });
    final auth = await FirebaseAuthServices()
        .createAccount(emailAddress: userEmail, password: userPassword);
    if (!mounted) return;

    if (auth) {
      setState(() {
        isLoading = !isLoading;
      });
      Navigator.pushReplacementNamed(context, AppRoutes.signUp);
    } else {
      setState(() {
        isLoading = !isLoading;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("SignUp failed. Please check your credentials."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacing.commonSpace(height: height * 0.06),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.logIn);
                  },
                  child: SvgPicture.asset(arrowLeft),
                ),
                Spacing.commonSpace(height: height * 0.06),
                const CustomText(
                  text: AppStrings.signUpText,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                Spacing.commonSpace(
                  width: width,
                  height: height * 0.01,
                ),
                const CustomText(
                  text: AppStrings.createAccountTitle,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  textColor: Color(0XFF808D9E),
                ),
                Spacing.commonSpace(
                  width: width,
                  height: height * 0.04,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0XFFE9ECF2),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: width,
                  height: height * 0.06,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/icons/google.png',
                        width: 24,
                        height: 24,
                      ),
                      Spacing.commonSpace(
                        width: width * 0.06,
                      ),
                      const CustomText(
                        text: AppStrings.googleSignIn,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
                Spacing.commonSpace(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomDivider.divider(
                      width: width * 0.42,
                      height: 1,
                      color: const Color(0XFFE9ECF2),
                    ),
                    const CustomText(
                      text: AppStrings.dividerText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      textColor: Color(
                        0XFF808D9E,
                      ),
                    ),
                    CustomDivider.divider(
                      width: width * 0.42,
                      height: 1,
                      color: const Color(0XFFE9ECF2),
                    ),
                  ],
                ),
                Spacing.commonSpace(height: height * 0.04),
                isLoading
                    ? Center(
                        child: LoadingAnimationWidget.inkDrop(
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    : CustomInputField(
                        controller: userNameController,
                        helperText: AppStrings.userHelperText,
                        assets: AppStrings.userPrefixIcon,
                      ),
                Spacing.commonSpace(height: height * 0.04),
                CustomInputField(
                  controller: emailController,
                  helperText: AppStrings.emailHelperText,
                  assets: AppStrings.emailPrefixIcon,
                ),
                Spacing.commonSpace(height: height * 0.04),
                CustomInputField(
                  controller: passwordController,
                  helperText: AppStrings.passwordHelperText,
                  assets: AppStrings.passwordPrefixIcon,
                  postFixIcon: AppStrings.eyeOffIcon,
                  showText: true,
                ),
                Spacing.commonSpace(
                  width: width,
                  height: height * 0.06,
                ),
                CustomButton(
                  width: width,
                  height: height * 0.06,
                  buttonLabel: AppStrings.signUpText,
                  onPress: () {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    signUp(userEmail: email, userPassword: password);

                    if (isLoading) {
                      Navigator.pushReplacementNamed(context, AppRoutes.logIn);
                    }
                  },
                ),
                Spacing.commonSpace(
                  width: width,
                  height: height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: AppStrings.haveAnAccount,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      textColor: Color(0XFF9CA3AF),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.logIn);
                      },
                      child: const CustomText(
                        text: AppStrings.signInButtonText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        textColor: Color(0XFF257CFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
