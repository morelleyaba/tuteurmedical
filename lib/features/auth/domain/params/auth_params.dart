// les paramettres qui doivent etres envoyés 
class AuthParams {
 final String email ;
 final String password;

 AuthParams({
required  this.email,
 required this.password
 });

   Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
    };
    return data;
  }
}
// pour faciliter l'envoie des données via l'Api