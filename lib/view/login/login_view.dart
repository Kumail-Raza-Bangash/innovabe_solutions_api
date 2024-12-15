import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/resourses/widgets/custom_text_form_field.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login".tr,
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: Dimensions.font20,
          ),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                size: Dimensions.iconSize24 * 4,
                color: AppColor.primaryColor,
              ),
              SizedBox(height: Dimensions.height20),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: loginVM.emailController.value,
                      focusNode: loginVM.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Email", "Please! Enter your email");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginVM.emailFocusNode.value,
                            loginVM.passwordFocusNode.value);
                      },
                      hintText: 'email_hint'.tr,
                      icon: const Icon(Icons.email),
                    ),
                    SizedBox(height: Dimensions.height10),
                    CustomTextFormField(
                      controller: loginVM.passwordController.value,
                      focusNode: loginVM.passwordFocusNode.value,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar(
                              "Password", "Please! Enter your Password");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                      hintText: 'password_hint'.tr,
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Obx(
                () => RoundButton(
                  title: 'login'.tr,
                  width: Dimensions.width15 * 15,
                  loading: loginVM.loading.value,
                  onPress: () {
                    if (_formkey.currentState!.validate()) {
                      loginVM.loginApi();
                    }
                  },
                ),
              ),
              SizedBox(height: Dimensions.height20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Don\'t have an Account? ",
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: Dimensions.font16),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(RoutesName.registerView);
                    },
                    child: Text(
                      "register".tr,
                      style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: Dimensions.font16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height20),
            ],
          ),
        ),
      ),
    );
  }
}
