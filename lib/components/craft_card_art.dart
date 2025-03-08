import 'dart:io';
import 'package:flutter/material.dart';
import 'package:caribe/model/craft_class.dart';

class CraftCard extends StatefulWidget {
  final CraftClass craft;

  const CraftCard({super.key, required this.craft});

  @override
  _CraftCardState createState() => _CraftCardState();
}

class _CraftCardState extends State<CraftCard> {
  bool isEditing = false; // Modo edición
  late TextEditingController titleController;
  late TextEditingController priceController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.craft.title);
    priceController =
        TextEditingController(text: widget.craft.price.toString());
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen del producto (Maneja URL o archivo local)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: widget.craft.imageFile != null
                ? Image.file(widget.craft.imageFile!,
                    height: 120, width: double.infinity, fit: BoxFit.cover)
                : widget.craft.imageUrl != null
                    ? Image.network(widget.craft.imageUrl!,
                        height: 120, width: double.infinity, fit: BoxFit.cover)
                    : Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported, size: 50),
                      ),
          ),
          const SizedBox(height: 8),

          // Nombre del artesano y precio
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(widget.craft.profileImageUrl),
                    backgroundColor: Colors.grey[300],
                  ),
                  const SizedBox(width: 6),
                  Text(widget.craft.artisanName,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              isEditing
                  ? SizedBox(
                      width: 80,
                      child: TextField(
                        controller: priceController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Precio"),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  : Text("\$${widget.craft.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),

          // Título editable
          isEditing
              ? TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Título del Producto"),
                )
              : Text(widget.craft.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),

          // Calificación y número de reseñas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(widget.craft.rating.toString(),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                ],
              ),
              Text("${widget.craft.reviews} reseñas",
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 12),

          // Botón para editar/guardar
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });

                if (!isEditing) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Producto actualizado')),
                  );
                  // Aquí podrías actualizar el producto en la base de datos
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Modo de edición activado')),
                  );
                }
              },
              child: Text(isEditing ? "Guardar Producto" : "Editar Producto",
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
