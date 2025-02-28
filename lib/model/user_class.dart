class User {
  final String nombre;
  final String email;
  final String password;

  // Constructor
  User({
    required this.nombre,
    required this.email,
    required this.password,
  });

  // Método para convertir el objeto a un mapa (JSON)
  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'email': email,
      'password': password,
    };
  }

  // Método para crear un objeto User desde un mapa (JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      nombre: json['nombre'],
      email: json['email'],
      password: json['password'],
    );
  }

  // Método para validar las credenciales
  static User? validateCredentials(
      String email, String password, List<User> users) {
    // Busca el usuario que coincida con el email y la contraseña
    for (var user in users) {
      if (user.email == email && user.password == password) {
        return user; // Si se encuentra, retorna el usuario
      }
    }
    return null; // Si no se encuentra el usuario
  }
}
