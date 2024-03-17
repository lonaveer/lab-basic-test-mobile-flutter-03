import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product {
  final int id;
  final String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) as List;
      productList.value = jsonData.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products');
    }
    isLoading(false);
  }
}