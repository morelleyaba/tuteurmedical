
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/auth/domain/entities/user.dart';
import '../../di/injection_container.dart';
import 'hive_keys.dart';

class HiveUtils {

// initialisation globale des boites (Box) au demarage de l'app
  static Future initBoxes() async{
  await Hive.initFlutter();
  await Hive.openBox(HiveKeys.secureBox); // je cree une boîte (Box) au nom de "HiveKeys.secureBox" pour stocker mes clés (le token JWT, les données de l'utilisateur)
  }

// --------------------
  // 🔐 TOKEN
  // --------------------

// simplifier l'ecriture : "Hive.box(HiveKeys.secureBox)" pour eviter de le repeter partout,
// on va l'identifier par "hiveSecureBox"
static Box get hiveSecureBox {
  return Hive.box(HiveKeys.secureBox);
}

// sauvegarder le token
  static Future<void> saveToken(String? token) async {
    await hiveSecureBox.put(HiveKeys.storageTokenKey, token);
  }

// recuperer le token
  static String? getToken() {
    return hiveSecureBox.get(HiveKeys.storageTokenKey);
  }

// suprimer le token
  static Future<void> clearToken() async {
    await hiveSecureBox.delete(HiveKeys.storageTokenKey);
  }

  // --------------------
  // 👤 USER (optionnel)
  // --------------------

// sauvegarde de l'utilisateur
static Future<void> saveUser(User? apprenant) async{
  await hiveSecureBox.put(HiveKeys.storageUserKey, apprenant);
}

// recuperer le user
static User? getUser() {
  return hiveSecureBox.get(HiveKeys.storageUserKey);
}

// supprimer le user
static Future<void> clearUser() async{
  await hiveSecureBox.delete(HiveKeys.storageUserKey);
}

// netoyer la boite lors de la deconnexion
static logOut(){
  hiveSecureBox.clear();
}

// Initialisation au démarrage de l'application (la boite de stockage Box et les injections de dependances)
static Future init() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveUtils.initBoxes();
  await InjectionContainer.init();
}
}