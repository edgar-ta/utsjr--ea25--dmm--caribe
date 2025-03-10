import 'dart:io';
import 'package:caribe/components/craft_card.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:caribe/pages/sign_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importar el paquete

class AppColors {
  static const Color azulCieloTropical = Color(0xFF87CEEB);
  static const Color naranjaAtardecer = Color(0xFFFF8C00);
  static const Color arenaCalida = Color(0xFFF5F5DC);
  static const Color blancoNitido = Color(0xFFFFFFFF);
  static const Color negroProfundo = Color(0xFF000000);
  static const Color grisSuave = Color(0xFFD3D3D3);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0; // Para controlar la pestaña seleccionada

  // Lista de pantallas
  final List<Widget> _screens = [
    const HomeScreen(), // Asegurar que HomeScreen tenga su propio SingleChildScrollView si es necesario
    SearchScreen(),
    const ProfileScreen(),
    const CartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Elimina el botón de regreso
        title: Image.asset(
          'assets/images/logotipo_largo.png', // Ruta del logo
          height: 70, // Ajusta el tamaño del logotipo
        ),
        backgroundColor:
            AppColors.azulCieloTropical, // Usamos el color azulCieloTropical
        centerTitle: true, // Centra el logotipo
      ),
      body: Container(
        color: AppColors.arenaCalida, // Fondo de la app
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Expande la pantalla seleccionada sin causar overflow
                child: IndexedStack(
                  index: _currentIndex,
                  children: _screens,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambiar a la pantalla correspondiente
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article,
              color: _currentIndex == 1
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Catalogo',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 2
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: _currentIndex == 3
                  ? AppColors.naranjaAtardecer
                  : AppColors.grisSuave,
            ),
            label: 'Carrito',
          ),
        ],
        selectedItemColor:
            AppColors.naranjaAtardecer, // Color del ícono seleccionado
        unselectedItemColor:
            AppColors.grisSuave, // Color del ícono no seleccionado
      ),
    );
  }
}

// Pantalla de inicio con carrusel
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, String>> _artesanias = [
    {
      'image': 'assets/images/sombrero_charro.jpg',
      'description': 'Sombrero de Charro, símbolo de la charrería mexicana.'
    },
    {
      'image': 'assets/images/mascara_madera.jpg',
      'description': 'Máscaras de madera, utilizadas en danzas y festivales.'
    },
    {
      'image': 'assets/images/alebrije.jpg',
      'description':
          'Alebrijes, figuras de colores vibrantes originarias de Oaxaca.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _artesanias.isEmpty
              ? const CircularProgressIndicator()
              : CarouselSlider(
                  items: _artesanias.map((artesania) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Stack(
                              children: [
                                Image.asset(
                                  artesania['image']!,
                                  width: double.infinity,
                                  height: 350,
                                  fit: BoxFit.cover,
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.black.withOpacity(0.6),
                                  child: Text(
                                    artesania['description']!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 350,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                  ),
                ),
        ],
      ),
    );
  }
}

// Pantalla de catalogo
class CatalogoScreen extends StatelessWidget {
  // Lista de ejemplo con productos de tipo CraftClass
  final List<CraftClass> crafts = [
    CraftClass(
      imageUrl: 'assets/images/sombrero_charro.jpg',
      title: 'Sombrero de Charro',
      price: 500.0,
      artisanName: 'Juan Pérez',
      profileImageUrl: 'assets/images/juan_perez.jpg',
      rating: 4.5,
      reviews: 23,
    ),
    CraftClass(
      imageUrl: 'assets/images/mascara_madera.jpg',
      title: 'Máscara de Madera',
      price: 150.0,
      artisanName: 'Ana Martínez',
      profileImageUrl: 'assets/images/ana_martinez.jpg',
      rating: 4.2,
      reviews: 15,
    ),
    CraftClass(
      imageUrl: 'assets/images/alebrije_colorido.jpg',
      title: 'Alebrije Colorido',
      price: 200.0,
      artisanName: 'Carlos González',
      profileImageUrl: 'assets/images/carlos_gonzalez.jpg',
      rating: 4.8,
      reviews: 42,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Número de columnas
        crossAxisSpacing: 12.0, // Espacio entre columnas
        mainAxisSpacing: 12.0, // Espacio entre filas
        childAspectRatio:
            0.35, // Relación ancho/alto de las celdas (más cortas)
      ),
      itemCount: crafts.length,
      itemBuilder: (context, index) {
        return CraftCard(craft: crafts[index]);
      },
    );
  }
}

// Pantalla de perfil
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = 'Nombre del Usuario';
  String userEmail = 'usuario@email.com';

  void _editProfile() {
    TextEditingController nameController =
        TextEditingController(text: userName);
    TextEditingController emailController =
        TextEditingController(text: userEmail);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Perfil'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: emailController,
                decoration:
                    const InputDecoration(labelText: 'Correo Electrónico'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  userEmail = emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Imagen de perfil
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
          ),
          const SizedBox(height: 20),
          // Nombre del usuario
          Text(
            userName,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Correo del usuario
          Text(
            userEmail,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          // Lista de opciones
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Editar Perfil'),
                  onTap: _editProfile,
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Cerrar Sesión'),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cerrando sesión...')),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => Registro()),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Pantalla de carrito (Ejemplo)
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Lista de productos en el carrito (puedes agregar más según tu modelo)
  List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/images/sombrero_charro.jpg',
      'title': 'Sombrero de Charro',
      'price': 500.0,
      'quantity': 1,
    },
    {
      'image': 'assets/images/mascara_madera.jpg',
      'title': 'Máscara de Madera',
      'price': 150.0,
      'quantity': 2,
    },
  ];

  // Calcular el total del carrito
  double get totalPrice {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la pantalla
          const Text(
            'Carrito de Compras',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Lista de productos en el carrito
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                var item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Image.asset(item['image'], width: 50),
                    title: Text(item['title']),
                    subtitle: Text(
                        'Precio: \$${item['price']} x ${item['quantity']}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.remove_shopping_cart),
                      onPressed: () {
                        setState(() {
                          cartItems
                              .removeAt(index); // Eliminar item del carrito
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          // Total y botones de acción
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aquí se puede agregar lógica para el proceso de pago
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Proceso de pago en desarrollo...')),
                    );
                  },
                  child: const Text('Pagar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.naranjaAtardecer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
