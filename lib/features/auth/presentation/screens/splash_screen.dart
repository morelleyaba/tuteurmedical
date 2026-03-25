import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/common/components/app_image.dart';
import '../cubit/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState() {
     super.initState();
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushNamed(context, AppRoutes.login);
    // });
    context.read<AuthCubit>().checkAuthStatus(); // Verifier si l'utilisateur est connecté
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  BlocListener<AuthCubit, AuthState>(
      listener: ( context, state) { 
        if(state.isAuthenticated){
          Navigator.pushReplacementNamed(context,AppRoutes.home);
        } else if (!state.isAuthenticated && !state.isLoading){
           Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushNamed(context, AppRoutes.login);
          });
        }
       },
      child: Scaffold(
        backgroundColor: AppColors.primayColor,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppImage(
                AppAssets.tutor,
                width: 300,
                height: 300,
                radius: 8,
              ),
              Text("Assistant Medical",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}