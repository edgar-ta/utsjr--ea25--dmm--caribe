class ArtisanClass {
  String id;
  String name;
  String description;
  String location;
  String email;
  String phone;

  /// URL of the artisan's profile picture
  String profilePicture;

  ArtisanClass({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.email,
    required this.phone,
    required this.profilePicture,
  });

  static final List<ArtisanClass> artisans = [
    ArtisanClass(
      id: "artisan1",
      name: "Juan Pérez López",
      description: "Entusiasta de la charrería en México",
      location: "San Juan del Río, Querétaro",
      email: "juanpl@gmail.com",
      phone: "+524271861970",
      profilePicture: "assets/images/profile_pictures/juan_perez.jpg",
    ),
    ArtisanClass(
      id: "artisan2",
      name: "Ana Martínez Hernández",
      description: "Carpintera queretana con 10 años de experiencia",
      location: "Querétaro de Arteaga, Querétaro",
      email: "anamh@gmail.com",
      phone: "+524271861970",
      profilePicture: "assets/images/profile_pictures/ana_martinez.jpg",
    ),
    ArtisanClass(
      id: "artisan3",
      name: "Carlos González Ramírez",
      description: "Creador de alebrijes en Querétaro",
      location: "Amealco, Querétaro",
      email: "carlosgr@gmail.com",
      phone: "+524271861970",
      profilePicture: "assets/images/profile_pictures/carlos_gonzalez.jpg",
    ),
  ];
}
