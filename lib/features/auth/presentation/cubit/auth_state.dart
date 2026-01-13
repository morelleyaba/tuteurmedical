part of 'auth_cubit.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final bool isAuthenticated;
   final User? user;
   final String? message;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.isAuthenticated = false,
    this.user,
    this.message,
  });

// Dans le pattern BLoC/Cubit, les états sont immuables.
//  C’est-à-dire tu ne modifies jamais un state, tu en crées un nouveau quand tu veux l'utiliser. 
//pour le faire on utilise "copyWith"
  AuthState copyWith({
    bool? isLoading,
    String? error,
    bool? isAuthenticated,
    User? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
    );
  }
}

// 2eme methode

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthError extends AuthState {
  AuthError({super.message});
}

// les 2 methodes de states sont juste, on utilise genelaralement la premiere quand on veux que 
// les changement se fassent automatiquement deh qu'il y'a changement d'etat dans l'app sans 
// l'intervention d'un evenement declanché manuelement