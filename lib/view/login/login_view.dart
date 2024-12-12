import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/utils.dart';
import 'package:innovabe_solutions_api/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM = Get.put(LoginController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login".tr,
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
            Form(
              key: _formkey,
              child: Column(
              children: [
                TextFormField(
              controller: loginVM.emailController.value,
              focusNode: loginVM.emailFocusNode.value,
              validator: (value){
                if(value!.isEmpty){
                  Utils.snackBar("Email", "Please! Enter your email");
                }
                return null;
              },
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, loginVM.emailFocusNode.value, loginVM.passwordFocusNode.value);
              },
              decoration: InputDecoration(
                hintText: 'email_hint'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: loginVM.passwordController.value,
              focusNode: loginVM.passwordFocusNode.value,
              obscureText: true,
              obscuringCharacter: '*',
              validator: (value){
                if(value!.isEmpty){
                  Utils.snackBar("Password", "Please! Enter your Password");
                }
                return null;
              },
              onFieldSubmitted: (value) {
                
              },
              decoration: InputDecoration(
                hintText: 'password_hint'.tr,
                border: const OutlineInputBorder(),
              ),
            ),
            ],
            ),
            ),
            
            const SizedBox(
              height: 20,
            ),
            Obx(() => RoundButton(
                title: 'login'.tr,
                width: 160,
                loading: loginVM.loading.value,
                onPress: () {
                  if(_formkey.currentState!.validate())
                    {
                      loginVM.loginApi();
                    }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
