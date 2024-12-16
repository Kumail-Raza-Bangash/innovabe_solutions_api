import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/widgets/custom_text_form_field.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';
import 'package:innovabe_solutions_api/view_model/todo/add_todo_view_model.dart';

class AddTodoView extends StatelessWidget {
  AddTodoView({Key? key}) : super(key: key);

  final addTodoVM = Get.put(AddTodoViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _form(),
            _button(),
          ],
        ),
      ),
    );
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: Dimensions.height20),
          CustomTextFormField(
            controller: addTodoVM.nameController.value,
            hintText: 'Title',
            icon: const Icon(Icons.title),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          SizedBox(height: Dimensions.height20),
          TextFormField(
            controller: addTodoVM.valueController.value,
            style: TextStyle(
                color: AppColor.greyColor, fontSize: Dimensions.font16),
            decoration: InputDecoration(
              hintText: "Message...",
              hintStyle: TextStyle(
                  color: AppColor.greyColor, fontSize: Dimensions.font16),
              prefixIcon: const Icon(
                Icons.message,
                color: AppColor.primaryColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius20 * 5),
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
    );
  }

  Widget _button() {
    return Obx(
      () => RoundButton(
        title: addTodoVM.loading.value ? 'Adding...' : 'Add Todo',
        width: Dimensions.width15 * 15,
        onPress: () {
          if (_formKey.currentState!.validate()) {
            addTodoVM.addTodoApi();
          }
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
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
          SizedBox(width: Dimensions.width10 / 2),
          Text(
            "Add Todo",
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: Dimensions.font26,
            ),
          ),
        ],
      ),
    );
  }
}
