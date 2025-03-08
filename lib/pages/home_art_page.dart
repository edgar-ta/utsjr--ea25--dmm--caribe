import 'package:caribe/components/craft_card.dart';
import 'package:caribe/model/craft_class.dart';
import 'package:caribe/pages/sign_page.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color azulCieloTropical = Color(0xFF87CEEB);
  static const Color naranjaAtardecer = Color(0xFFFF8C00);
  static const Color arenaCalida = Color(0xFFF5F5DC);
  static const Color blancoNitido = Color(0xFFFFFFFF);
  static const Color negroProfundo = Color(0xFF000000);
  static const Color grisSuave = Color(0xFFD3D3D3);
}

class ArtesanoHome extends StatefulWidget {
  const ArtesanoHome({super.key});

  @override
  _ArtesanoHomeState createState() => _ArtesanoHomeState();
}

class _ArtesanoHomeState extends State<ArtesanoHome> {
  int _currentIndex = 0; // Índice de la pantalla seleccionada

  // Lista de pantallas
  final List<Widget> _screens = [
    ProductosScreen(),
    const PedidosScreen(),
    const ProfileScreen(),
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
      body: _screens[_currentIndex], // Mostrar la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Cambiar a la pantalla correspondiente
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reorder),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        selectedItemColor: AppColors.naranjaAtardecer,
        unselectedItemColor: AppColors.grisSuave,
        backgroundColor: AppColors.azulCieloTropical,
      ),
      backgroundColor: AppColors.arenaCalida, // Color de fondo para la pantalla
    );
  }
}

//Productos Screen
class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  _ProductosScreenState createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  // Productos de ejemplo
  List<CraftClass> productos = [
    CraftClass(
      imageUrl: 'https://via.placeholder.com/150', // Imagen ficticia
      artisanName: 'Artesano 1',
      profileImageUrl:
          'https://via.placeholder.com/50', // Imagen ficticia del artesano
      price: 150.00,
      title: 'Vaso de Cerámica',
      rating: 4.5,
      reviews: 12,
    ),
    CraftClass(
      imageUrl: 'https://via.placeholder.com/150', // Imagen ficticia
      artisanName: 'Artesano 2',
      profileImageUrl:
          'https://via.placeholder.com/50', // Imagen ficticia del artesano
      price: 250.00,
      title: 'Bolso de Cuero',
      rating: 4.8,
      reviews: 8,
    ),
    CraftClass(
      imageUrl: 'https://via.placeholder.com/150', // Imagen ficticia
      artisanName: 'Artesano 3',
      profileImageUrl:
          'https://via.placeholder.com/50', // Imagen ficticia del artesano
      price: 300.00,
      title: 'Colgante de Plata',
      rating: 4.0,
      reviews: 15,
    ),
  ];

  // Variables para almacenar el producto seleccionado y sus datos editados
  CraftClass? selectedProduct;
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.arenaCalida, // Color de fondo de la pantalla
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (productos.isNotEmpty) ...[
              // Si hay productos, muestra la lista de productos
              Expanded(
                child: ListView.builder(
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    return CraftCard(craft: productos[index]);
                  },
                ),
              ),
            ] else ...[
              // Si no hay productos, muestra el botón
              ElevatedButton(
                onPressed: null, // Acción para ver lista de productos
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.naranjaAtardecer, // Color del botón
                ),
                child: const Text('Ver Productos'), // Botón con texto
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'add') {
            // Acción para agregar producto
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Agregar Producto'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            labelText: 'Título del Producto'),
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Precio'),
                        keyboardType: TextInputType.number,
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
                        // Aquí puedes agregar lógica para guardar el producto
                        Navigator.of(context).pop();
                      },
                      child: const Text('Guardar'),
                    ),
                  ],
                );
              },
            );
          } else if (value == 'edit') {
            // Acción para editar producto
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Editar Producto'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButton<CraftClass>(
                        hint: const Text('Selecciona un producto'),
                        value: selectedProduct,
                        onChanged: (CraftClass? newProduct) {
                          setState(() {
                            selectedProduct = newProduct;
                            // Cargar los datos del producto seleccionado en los campos
                            if (selectedProduct != null) {
                              titleController.text = selectedProduct!.title;
                              priceController.text =
                                  selectedProduct!.price.toString();
                            }
                          });
                        },
                        items: productos.map<DropdownMenuItem<CraftClass>>(
                            (CraftClass product) {
                          return DropdownMenuItem<CraftClass>(
                            value: product,
                            child: Text(product.title),
                          );
                        }).toList(),
                      ),
                      if (selectedProduct != null) ...[
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                              labelText: 'Título del Producto'),
                        ),
                        TextField(
                          controller: priceController,
                          decoration:
                              const InputDecoration(labelText: 'Precio'),
                          keyboardType: TextInputType.number,
                        ),
                      ],
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
                        // Aquí puedes agregar la lógica para guardar el producto editado
                        if (selectedProduct != null) {
                          setState(() {
                            // Actualiza los datos del producto seleccionado
                            selectedProduct!.title = titleController.text;
                            selectedProduct!.price =
                                double.tryParse(priceController.text) ??
                                    selectedProduct!.price;
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text('Guardar Cambios'),
                    ),
                  ],
                );
              },
            );
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem<String>(
            value: 'add',
            child: Row(
              children: const [
                Icon(Icons.add, color: AppColors.naranjaAtardecer),
                SizedBox(width: 8),
                Text('Agregar Producto'),
              ],
            ),
          ),
          PopupMenuItem<String>(
            value: 'edit',
            child: Row(
              children: const [
                Icon(Icons.edit, color: AppColors.naranjaAtardecer),
                SizedBox(width: 8),
                Text('Editar Producto'),
              ],
            ),
          ),
        ],
        icon: Icon(Icons.more_vert,
            color: AppColors.naranjaAtardecer), // Icono de menú
      ),
    );
  }
}

// Pantalla de Pedidos
class PedidosScreen extends StatelessWidget {
  const PedidosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de pedidos de ejemplo
    List<Map<String, dynamic>> pedidos = [
      {
        'producto': 'Vaso de Cerámica',
        'artesano': 'Artesano 1',
        'estado': 'Enviado',
        'precio': 150.00,
      },
      {
        'producto': 'Bolso de Cuero',
        'artesano': 'Artesano 2',
        'estado': 'Pendiente',
        'precio': 250.00,
      },
      {
        'producto': 'Colgante de Plata',
        'artesano': 'Artesano 3',
        'estado': 'Entregado',
        'precio': 300.00,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.arenaCalida, // Color de fondo de la pantalla
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (pedidos.isNotEmpty) ...[
              // Si hay pedidos, muestra la lista
              Expanded(
                child: ListView.builder(
                  itemCount: pedidos.length,
                  itemBuilder: (context, index) {
                    var pedido = pedidos[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(pedido['producto']),
                        subtitle: Text('Por: ${pedido['artesano']}'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('\$${pedido['precio'].toStringAsFixed(2)}'),
                            const SizedBox(height: 4),
                            Text(
                              pedido['estado'],
                              style: TextStyle(
                                color: pedido['estado'] == 'Enviado'
                                    ? Colors.green
                                    : pedido['estado'] == 'Pendiente'
                                        ? Colors.orange
                                        : Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else ...[
              // Si no hay pedidos, muestra el botón
              ElevatedButton(
                onPressed: null, // Acción para ver pedidos
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      AppColors.naranjaAtardecer, // Color del botón
                ),
                child: const Text('Ver Pedidos'), // Botón con texto
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// Pantalla de Perfil
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
                    // Mostrar SnackBar de cierre de sesión
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cerrando sesión...')),
                    );

                    // Redirigir después de un delay
                    Future.delayed(const Duration(seconds: 2), () {
                      // Redirigir a la pantalla de Registro()
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Registro()),
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
