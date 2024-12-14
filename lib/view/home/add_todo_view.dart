import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/widgets/custom_text_form_field.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/view_model/controller/todo/todo_view_model.dart';

class AddTodoView extends StatefulWidget {
  AddTodoView({Key? key}) : super(key: key);

  @override
  State<AddTodoView> createState() => _AddTodoViewState();
}

class _AddTodoViewState extends State<AddTodoView> {
  final TodoViewModel todoViewModel = Get.put(TodoViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "Add Todo",
          style: TextStyle(
              color: AppColor.whiteColor, fontSize: Dimensions.font26),
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
                  CustomTextFormField(
                    controller: todoViewModel.titleController.value,
                    hintText: 'Title',
                    icon: const Icon(Icons.title),
                  ),
                  SizedBox(width: Dimensions.height15),
                  CustomTextFormField(
                    controller: todoViewModel.descriptionController.value,
                    hintText: 'Description',
                    icon: const Icon(Icons.title),
                  ),
                  SizedBox(width: Dimensions.height30),
                ],
              ),
            ),
            Obx(
              () => RoundButton(
                title: 'Add Todo',
                width: Dimensions.width15 * 15,
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                    todoViewModel.postTodo();
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
