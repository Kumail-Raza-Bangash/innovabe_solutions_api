import 'package:flutter/material.dart';
import 'package:innovabe_solutions_api/resourses/colors.dart';
import 'package:innovabe_solutions_api/utils/dimensions.dart';

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
    this.height = 30,
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
          borderRadius: BorderRadius.circular(Dimensions.radius15 * 3),
        ),
        child: loading
            ? Center(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.width10),
                  child: const CircularProgressIndicator(
                    color: AppColor.whiteColor,
                  ),
                ),
              )
            : Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: textColor,
                        fontSize: Dimensions.font20,
                      ),
                ),
              ),
      ),
    );
  }
}
