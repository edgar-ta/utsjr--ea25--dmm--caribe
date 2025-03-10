import 'package:flutter/material.dart';
import 'package:caribe/model/user_class.dart'; // Importa el modelo User
import 'package:caribe/pages/home_page.dart'; // Importa la pantalla Home
import 'package:caribe/pages/sign_page.dart';
import 'package:caribe/pages/home_art_page.dart'; // Importa la pantalla Home para artesanos

// Definimos los colores globales de la aplicación
class AppColors {
  static const Color azulCieloTropical = Color(0xFF87CEEB);
  static const Color naranjaAtardecer = Color(0xFFFF8C00);
  static const Color arenaCalida = Color(0xFFF5F5DC);
  static const Color blancoNitido = Color(0xFFFFFFFF);
  static const Color negroProfundo = Color(0xFF000000);
  static const Color grisSuave = Color(0xFFD3D3D3);
}

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
    // Tamaño de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.arenaCalida, // Fondo claro para la pantalla
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen más grande y centrada
            Center(
              child: Image.asset(
                'assets/images/logotipo.png', // Asegúrate de que esta ruta sea correcta
                height: screenHeight *
                    0.45, // Hacemos la imagen más grande, ocupando el 40% de la altura
              ),
            ),
            // Caja de formulario con bordes redondeados
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 6.0, // Elevación más suave
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
                              fontSize: 16, // Tamaño de la fuente ajustado
                              fontWeight: FontWeight.bold,
                              color: AppColors
                                  .azulCieloTropical, // Color del texto
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0),

                        // Campo Email
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Correo electrónico',
                            labelStyle: TextStyle(
                                color: AppColors
                                    .azulCieloTropical), // Color del label
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors
                                      .azulCieloTropical), // Color del borde
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su correo electrónico';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Por favor ingrese un correo válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14.0),

                        // Campo Contraseña
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            labelStyle: TextStyle(
                                color: AppColors
                                    .azulCieloTropical), // Color del label
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors
                                      .azulCieloTropical), // Color del borde
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su contraseña';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14.0),

                        // Botón de Login
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                screenWidth *
                                    0.65, // Ajustamos el tamaño del botón al 65% del ancho de la pantalla
                                50,
                              ),
                              backgroundColor: AppColors
                                  .naranjaAtardecer, // Color de fondo del botón
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: _iniciarSesion,
                            child: const Text(
                              'Iniciar sesión',
                              style: TextStyle(
                                  fontSize: 14.0), // Reducir tamaño del texto
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0),

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
                            child: const Text(
                              '¿No tienes cuenta? Regístrate',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors
                                      .azulCieloTropical), // Color del texto
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
