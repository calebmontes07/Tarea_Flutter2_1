import 'package:flutter/material.dart';

class DetalleProductoPage extends StatelessWidget {
  const DetalleProductoPage({super.key, required this.id, this.extras});

  final String id;
  final Map? extras;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF5F5DC),  // Color crema
        title: Text(
          extras?['title'] ?? "Producto",  // Nombre del producto en lugar del número
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black), // Letras en negro
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border, color: Colors.black))], // Icono en negro
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(extras?['image'] ?? "https://via.placeholder.com/280"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  extras?['title'] ?? "Producto",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Color(0xFFA7C7E7)), // Color no modificado
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xFFFFD700), size: 28),
                    SizedBox(width: 5),
                    Text("${extras?['rating'] ?? "0.0"}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)), // Letras en negro
                    SizedBox(width: 5),
                    Text("(${extras?['reviews'] ?? "0"} opiniones)", style: TextStyle(color: Colors.grey, fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              extras?['description'] ?? "No hay descripción disponible.",
              style: TextStyle(fontSize: 18, color: Colors.black), // Letras en negro
            ),
            Spacer(),
            // Cajita encima del precio con color crema
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5DC), // Color crema
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "\$${extras?['price'] ?? "0.00"}",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black), // Letras en negro
              ),
            ),
            SizedBox(height: 16), // Un pequeño espacio entre la cajita y el botón
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón de "Comprar ahora"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    backgroundColor: Color(0xFFD2B48C), // Color café claro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Comprar ahora", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                // Botón de "Añadir al carrito"
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    backgroundColor: Color(0xFFD2B48C), // Color café claro
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Añadir al carrito", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DetalleProductoPage(
      id: "001",
      extras: {
        "title": "Carro Mostro",
        "image": "https://via.placeholder.com/280",
        "rating": 4.0,
        "reviews": 69,
        "description": "Carro Mostro, todo grandote todo mostro.",
        "price": 777.00,
      },
    ),
  ));
}
