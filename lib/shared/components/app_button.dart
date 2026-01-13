import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';

class AppButton extends StatelessWidget {
   AppButton({super.key, required this.size,  this.press,required this.isLoading});

  final Size size;
  final VoidCallback? press;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
            color: AppColors.primayColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  spreadRadius: .5,
                  offset: const Offset(2, 4),
                  color: AppColors.primayColor.withOpacity(.2))
            ]),
        margin: EdgeInsets.symmetric(vertical: AppConstants.defaultvalue * 2),
        padding: EdgeInsets.symmetric(vertical: AppConstants.defaultvalue * .7),
        child: 
        isLoading
        ? Center(
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          )
        :Text(
          "Se connecter",
          textAlign: TextAlign.center,
          style: TextTheme.of(context).titleSmall?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
