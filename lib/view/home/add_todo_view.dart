import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/widgets/custom_text_form_field.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';

class AddTodoView extends StatefulWidget {
  AddTodoView({Key? key}) : super(key: key);

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  // final TodoViewModel todoViewModel = Get.put(TodoViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColor.whiteColor,
                size: Dimensions.font16,
              ),
            ),
            SizedBox(width: Dimensions.width10/2),
            Text(
              "Add Todo",
              style: TextStyle(
                  color: AppColor.whiteColor, fontSize: Dimensions.font26),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: Dimensions.height30),
                  CustomTextFormField(
                    //controller: todoViewModel.titleController.value,
                    hintText: 'Title',
                    icon: const Icon(Icons.title),
                  ),
                  SizedBox(height: Dimensions.height15),
                  TextFormField(
                    style: TextStyle(
                        color: AppColor.greyColor, fontSize: Dimensions.font16),
                    decoration: InputDecoration(
                      hintText: "Message...",
                      hintStyle: TextStyle(
                          color: AppColor.greyColor,
                          fontSize: Dimensions.font16),
                      prefixIcon: const Icon(Icons.message,
                          color: AppColor.primaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 * 5),
                        borderSide: const BorderSide(
                          color: AppColor.primaryColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 * 5),
                        borderSide: const BorderSide(
                          color: AppColor.greyColor,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimensions.height30),
                ],
              ),
            ),
            RoundButton(
              title: 'Add Todo',
              width: Dimensions.width15 * 15,
              onPress: () {
                if (_formkey.currentState!.validate()) {
                  //todoViewModel.postTodo();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
