import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/resourses/widgets/custom_text_form_field.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/register/register_view_model.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final registerVM = Get.put(RegisterViewModel());

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "register".tr,
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
                      controller: registerVM.nameController.value,
                      focusNode: registerVM.nameFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Name", "Please! Enter your name");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            registerVM.nameFocusNode.value,
                            registerVM.emailFocusNode.value);
                      },
                      hintText: 'name'.tr,
                      icon: const Icon(Icons.person),
                    ),
                    SizedBox(height: Dimensions.height10),
                    CustomTextFormField(
                      controller: registerVM.emailController.value,
                      focusNode: registerVM.emailFocusNode.value,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Email", "Please! Enter your email");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            registerVM.emailFocusNode.value,
                            registerVM.passwordFocusNode.value);
                      },
                      hintText: 'email_hint'.tr,
                      icon: const Icon(Icons.email),
                    ),
                    SizedBox(height: Dimensions.height10),
                    CustomTextFormField(
                      controller: registerVM.passwordController.value,
                      focusNode: registerVM.passwordFocusNode.value,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar(
                              "Password", "Please! Enter your Password");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            registerVM.passwordFocusNode.value,
                            registerVM.conformPasswordFocusNode.value);
                      },
                      hintText: 'password_hint'.tr,
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                    SizedBox(height: Dimensions.height10),
                    CustomTextFormField(
                      controller: registerVM.conformPasswordController.value,
                      focusNode: registerVM.conformPasswordFocusNode.value,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Conform Password",
                              "Please! Enter your Conform Password");
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
                  title: 'register'.tr,
                  width: Dimensions.width15 * 15,
                  loading: registerVM.loading.value,
                  onPress: () {
                    if (_formkey.currentState!.validate()) {
                      registerVM.registerApi();
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
                    "Already have an Account? ",
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: Dimensions.font16),
                  ),
                  InkWell(
                    onTap: () {
                      Get.offAndToNamed(RoutesName.loginView);
                    },
                    child: Text(
                      "login".tr,
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
