import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuteur_medical/features/auth/presentation/cubit/auth_cubit.dart';
import 'core/di/injection_container.dart';
import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/data/repositories_impl/auth_repository_impl.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add your Cubit providers here
        // BlocProvider<AuthCubit>(create: (context) => AuthCubit(repository: AuthRepositoryImpl())),
        BlocProvider(
            create: (_) => locator<AuthCubit>()
          )

      ],
      child: MaterialApp(
        title: 'tuteur_medical',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,        
      debugShowCheckedModeBanner: false,
      ),
    );
  }
}
