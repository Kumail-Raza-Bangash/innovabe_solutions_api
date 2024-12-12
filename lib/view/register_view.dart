import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/routes/routes_name.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
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
          style: const TextStyle(
            color: AppColor.whiteColor,
          ),
        ),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.person,
              size: 20,
            ),
            const SizedBox(height: 20),
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
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
                    decoration: InputDecoration(
                      hintText: 'name'.tr,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
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
                    decoration: InputDecoration(
                      hintText: 'email_hint'.tr,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: registerVM.passwordController.value,
                    focusNode: registerVM.passwordFocusNode.value,
                    obscureText: true,
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
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: registerVM.conformPasswordController.value,
                    focusNode: registerVM.conformPasswordFocusNode.value,
                    obscureText: true,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.snackBar(
                            "Conform Password", "Please! Enter your Password");
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                      hintText: 'password_hint'.tr,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => RoundButton(
                title: 'register'.tr,
                width: 160,
                loading: registerVM.loading.value,
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                    registerVM.registerApi();
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text("Already have an Account?", style: TextStyle(color: AppColor.primaryTextColor),),
            TextButton(
              onPressed: () {
                Get.offAll(RoutesName.loginView);
              },
              child: Text.rich(
                TextSpan(
                  text: "login".tr,
                  style: const TextStyle(color: AppColor.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
