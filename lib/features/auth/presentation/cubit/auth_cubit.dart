import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuteur_medical/features/auth/domain/usecases/get_current_user_use_case.dart';
import 'package:tuteur_medical/features/auth/domain/params/auth_params.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/is_logged_in_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/logout_use_case.dart';
import '../../domain/usecases/register_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  // final AuthRepository repository;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final IsLoggedInUseCase isLoggedInUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthCubit({
    // required this.repository
    required this.isLoggedInUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.registerUseCase,
    required this.getCurrentUserUseCase}

    ) : super(const AuthState());

// la fonction "connexion" creé ici sera utilisé sur le formulaire "context.read<AuthCubit>().conexion" pour contenir les données
  Future<void> conexion(AuthParams authParams) async {
    // creer / emetre un nouvel etat avec "copyWith"
    emit(state.copyWith(isLoading: true, error: null));
    
    try {
      final result = await loginUseCase(authParams); // le resultat de cette fonction vient de "login" dans "AuthRepositoryImpl" ou on a fait l'implementation, mais la fonction vient de usecase/ mais la fonction "loginUseCase" vient de usecase
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        user: result,
      ));
    print("reponse : $result");
    } catch (e, strack) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Login failed: $e',
      ));

    print('erreur $strack');
    }
  }

  Future<void> register(String email, String password, String name) async {
    emit(state.copyWith(isLoading: true, error: null));
    
    try {
      final user = await registerUseCase(email, password, name);
      emit(state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        user: user,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Registration failed: $e',
      ));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      await logoutUseCase();
      emit(const AuthState());
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Logout failed: $e',
      ));
    }
  }

// verifier si l'utilisateur est connecté
  Future<void> checkAuthStatus() async {
    emit(state.copyWith(isLoading: true));
    
    try {
      final isLoggedIn = await isLoggedInUseCase(); //le resultat de cette fonction vient de "isLoggedIn" dans "AuthRepositoryImpl" ou on a fait l'implementation/ mais la fonction "isLoggedInUseCase" vient de usecase
      if (isLoggedIn) { // si l'utilisateur est connecté alors recuperer son profile et le garder connecté
        final currentUser = await getCurrentUserUseCase();  //le resultat de cette fonction vient de "getCurrentUser" dans "AuthRepositoryImpl" ou on a fait l'implementation/ mais la fonction "getCurrentUserUseCase" vient de usecase
        emit(state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          user: currentUser,
        ));
      } else {
        emit(state.copyWith(isLoading: false, isAuthenticated: false, user: null));
        await logoutUseCase();
      }
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: 'Auth check failed: $e',
      ));
    }
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

}
