import 'package:flutter/material.dart';
import 'package:caribe/model/user_class.dart'; // Asegúrate de importar el modelo User
import 'package:caribe/pages/login_page.dart'; // Importamos la pantalla de Login
import 'package:caribe/pages/home_page.dart'; // Importamos la pantalla de Home
import 'package:caribe/pages/home_art_page.dart'; // Importamos la pantalla de Home para artesanos

// Definir la paleta de colores
class AppColors {
  static const Color azulCieloTropical = Color(0xFF87CEEB);
  static const Color naranjaAtardecer = Color(0xFFFF8C00);
  static const Color arenaCalida = Color(0xFFF5F5DC);
  static const Color blancoNitido = Color(0xFFFFFFFF);
  static const Color negroProfundo = Color(0xFF000000);
  static const Color grisSuave = Color(0xFFD3D3D3);
}

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>(); // Clave global para el formulario
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _esArtesano = false; // Estado para el checkbox

  // Función para manejar el registro
  void _registrarUsuario() {
    if (_formKey.currentState!.validate()) {
      final nuevoUsuario = User(
        nombre: _nombreController.text,
        email: _emailController.text,
        password: _passwordController.text,
        tipo: _esArtesano ? 'artesano' : 'usuario',
      );

      final userJson = nuevoUsuario.toJson();
      print("Usuario registrado: ${userJson}");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro exitoso')),
      );

      // Redirigir dependiendo de si es artesano o usuario
      if (_esArtesano) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ArtesanoHome()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
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
      backgroundColor:
          AppColors.arenaCalida, // Fondo claro para la pantalla de registro
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen más grande y centrada
            Center(
              child: Image.asset(
                'assets/images/logotipo.png', // Asegúrate de que esta ruta sea correcta
                height: screenHeight *
                    0.45, // Hacemos la imagen más grande, ocupando el 45% de la altura
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
                            'Crea una cuenta',
                            style: TextStyle(
                              fontSize: 16, // Tamaño de la fuente ajustado
                              fontWeight: FontWeight.bold,
                              color: AppColors.azulCieloTropical,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0),

                        // Campo Nombre
                        TextFormField(
                          controller: _nombreController,
                          decoration: const InputDecoration(
                            labelText: 'Nombre completo',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese su nombre';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 14.0),

                        // Campo Email
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
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
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
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

                        // Checkbox para determinar si es artesano
                        Row(
                          children: [
                            Checkbox(
                              value: _esArtesano,
                              onChanged: (value) {
                                setState(() {
                                  _esArtesano = value!;
                                });
                              },
                            ),
                            const Text('¿Eres artesano?',
                                style: TextStyle(
                                    color: AppColors.azulCieloTropical)),
                          ],
                        ),
                        const SizedBox(height: 14.0),

                        // Botón de Registro
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                screenWidth *
                                    0.65, // Ajustamos el tamaño del botón al 65% del ancho de la pantalla
                                50,
                              ),
                              backgroundColor: AppColors.naranjaAtardecer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: _registrarUsuario,
                            child: const Text(
                              'Registrar',
                              style: TextStyle(
                                  fontSize: 14.0), // Reducir tamaño del texto
                            ),
                          ),
                        ),
                        const SizedBox(height: 14.0),

                        // Texto adicional para redirigir a login
                        Center(
                          child: TextButton(
                            onPressed: () {
                              // Redirigir a la pantalla de login
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              '¿Ya tienes cuenta? Iniciar sesión',
                              style: TextStyle(
                                  fontSize: 12.0,
                                  color: AppColors.azulCieloTropical),
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
