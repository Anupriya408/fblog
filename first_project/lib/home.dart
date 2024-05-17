// import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class Product {
  final String name;
  final String imageUrl;

Product({
    required this.name,
    required this.imageUrl,
    
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List Is Here...!!!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Product> products = List.generate(20, (index) => Product(
    name: 'Product ${index + 1}',
    imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.EiLQxWQybyjEkZW1NhYrOwAAAA&pid=Api&P=0&h=180',
  ));



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(products[index].imageUrl),
            ),
            title: Text(products[index].name),
            // subtitle: Text('\$${products[index]}'),
            subtitle: const Text('For Description Click On Products....'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              product.name,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Image.network(
              product.imageUrl,
              width: 300.0,
              height: 300.0,
            ),
            const SizedBox(height: 10.0),
           
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Click Here To Go Back',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              
              ),
              
            ),
          ],
        ),
      ),
    );
  }
}