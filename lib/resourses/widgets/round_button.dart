import 'package:flutter/material.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height, width;
  final bool loading;
  final Color textColor, buttonColor;

  const RoundButton({
    super.key,
    required this.title,
    required this.onPress,
    this.loading = false,
    this.height = 40,
    this.width = 100,
    this.textColor = AppColor.whiteColor,
    this.buttonColor = AppColor.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.whiteColor,
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: textColor,
                      ),
                ),
              ),
      ),
    );
  }
}
