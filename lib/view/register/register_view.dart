import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/controller/register/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final registerVM = Get.put(RegisterController());
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
                    TextFormField(
                      controller: registerVM.nameController.value,
                      focusNode: registerVM.nameFocusNode.value,
                      style: TextStyle(color: AppColor.greyColor, fontSize: Dimensions.font20),
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
                      decoration: InputDecoration(
                        hintText: 'name'.tr,
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius20*5),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    TextFormField(
                      controller: registerVM.emailController.value,
                      focusNode: registerVM.emailFocusNode.value,
                      style: TextStyle(color: AppColor.greyColor, fontSize: Dimensions.font20),
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
                      decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius20*5),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    TextFormField(
                      controller: registerVM.passwordController.value,
                      focusNode: registerVM.passwordFocusNode.value,
                      obscureText: true,
                      style: TextStyle(color: AppColor.greyColor, fontSize: Dimensions.font20),
                      obscuringCharacter: '*',
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
                      decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        prefixIcon: const Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius20*5),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10),
                    TextFormField(
                      controller: registerVM.conformPasswordController.value,
                      focusNode: registerVM.conformPasswordFocusNode.value,
                      obscureText: true,
                      style: TextStyle(color: AppColor.greyColor, fontSize: Dimensions.font20),
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Conform Password",
                              "Please! Enter your Conform Password");
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: 'conform_password'.tr,
                        prefixIcon: const Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Dimensions.radius20*5),
                        ),
                      ),
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
