import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/resourses/widgets/round_button.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({
    super.key,
    required this.onPress,
  });

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          SizedBox(
            height: height * .15,
          ),
          const Icon(
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'internet_exception'.tr,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: height * .15,
          ),
          RoundButton(
            title: "Retry",
            onPress: widget.onPress,
            width: 160,
          ),
        ],
      ),
    );
  }
}
