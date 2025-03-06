import 'package:flutter/material.dart';
import 'package:caribe/model/user_class.dart'; // Importa el modelo User
import 'package:caribe/pages/home_page.dart'; // Importa la pantalla Home
import 'package:caribe/pages/sign_page.dart';
import 'package:caribe/pages/home_art_page.dart'; // Importa la pantalla Home para artesanos

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Lista de usuarios simulados con diferentes tipos
  final List<User> _usuarios = [
    User(
        nombre: 'Juan Pérez',
        email: 'usuario@example.com',
        password: '123456',
        tipo: 'usuario'),
    User(
        nombre: 'Ana Gómez',
        email: 'ana@example.com',
        password: 'password123',
        tipo: 'artesano'),
  ];

  // Lógica de autenticación
  void _iniciarSesion() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Validamos las credenciales usando el método estático validateCredentials
      User? user = User.validateCredentials(email, password, _usuarios);

      if (user != null) {
        // Redirigir a la pantalla correspondiente según el tipo de usuario
        if (user.tipo == 'usuario') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else if (user.tipo == 'artesano') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ArtesanoHome()),
          );
        }
      } else {
        // Si las credenciales son incorrectas, mostramos un mensaje de error
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Correo o contraseña incorrectos')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // Campo Email
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo electrónico',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su correo electrónico';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Por favor ingrese un correo válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),

                  // Campo Contraseña
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingrese su contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0),

                  // Botón de Login
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize:
                            const Size(double.infinity, 50), // Ancho completo
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: _iniciarSesion,
                      child: const Text(
                        'Iniciar sesión',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // Texto adicional para redirigir a registro
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Redirigir a la pantalla de registro
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Registro()),
                        );
                      },
                      child: const Text('¿No tienes cuenta? Regístrate'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
