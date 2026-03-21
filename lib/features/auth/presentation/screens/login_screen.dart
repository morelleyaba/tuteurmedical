import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuteur_medical/core/constants/app_constants.dart';
import 'package:tuteur_medical/features/auth/domain/params/auth_params.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/common/components/app_image.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/hive/hive_utils.dart';
import '../../../../shared/components/app_button.dart';
import '../cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  final token = HiveUtils.getToken();
  
@override
void initState(){
   super.initState();

  _emailController.text = "codebymorelle@gmail.com";
  _passwordController.text = "123456";
      print("-----tokenPrefString-----");
      print("$token");

}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state.isAuthenticated && state.user != null) {
          // Navigation vers l'écran principal après connexion réussie
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
        if(state.isLoading == true){
          setState(() {
          _isLoading = true;
          });
        }
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 16.0, horizontal: AppConstants.defaultvalue * 2),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // Text(
              //   'Tuteur Medical',
              //   style: TextTheme.of(context).titleLarge?.
              //   copyWith(color: AppColors.primayColor, fontFamily: "Quicksand"),
              // ),
               SizedBox(height: AppConstants.defaultvalue * 2),
                 AppImage(
                AppAssets.tutor,
                width: 150,
                height: 150,
                radius: 8,
              ),
               SizedBox(height: AppConstants.defaultvalue * 2),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Connecte toi a ton compte",
                    style: TextTheme.of(context).titleMedium?.copyWith(
                        fontWeight: FontWeight.w600, color: Colors.black54),
                  )),
               SizedBox(height: AppConstants.defaultvalue),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
               SizedBox(height: AppConstants.defaultvalue),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                ),
              ),
              AppButton(
                        size: size,
                        press: _isLoading ? null : _performLogin, 
                        isLoading: _isLoading,
                      ),
              SizedBox(height: AppConstants.defaultvalue),
              Text(
                "Ou se connecter avec",
                style: TextTheme.of(context)
                    .labelMedium
                    ?.copyWith(color: Colors.black54),
              ),
               SizedBox(height: AppConstants.defaultvalue),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppImage(
                    AppAssets.google,
                    width: 20,
                    height: 20,
                    radius: 8,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: AppConstants.defaultvalue * 3),
                    child: AppImage(
                      AppAssets.facebook,
                      width: 20,
                      height: 20,
                      radius: 8,
                    ),
                  ),
                  AppImage(
                    AppAssets.twitter,
                    width: 20,
                    height: 20,
                    radius: 8,
                  ),
          
                ],
               ),
              const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _performLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // la fonction "conexion" utilisé ici vient de authCubit
    context.read<AuthCubit>().conexion(
    AuthParams(email: email, password: password)
    );
    print("resultat  $email $password");


    // TODO: Implement login logic based on state management
  }

  // Future<void> login() async {
  //   try {
  //     print("STATUS: Hello"); 
  //     final dio = Dio();

  //     final response = await dio.post(
  //       "http://10.0.2.2:8000/login", // ⚠️ adapte IP si nécessaire
  //       data: {
  //         "email": _emailController.text.trim(),
  //         "password": _passwordController.text.trim(),
  //       },
  //     );

  //     print("STATUS: ${response.statusCode}");
  //     print("DATA VALUE: ${response.data}");

  //   } catch (e) {
  //     print("ERREUR LOGIN: $e");
  //   }
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

