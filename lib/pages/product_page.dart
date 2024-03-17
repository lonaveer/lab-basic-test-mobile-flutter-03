import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/controllers/product_controller.dart';

void main() => runApp(ProductPageApp());

class ProductPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Product List")),
        body: Obx(() {
          if (productController.isLoading.value)
            return Center(child: CircularProgressIndicator());
          else
            return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(productController.productList[index].name),
                );
              },
            );
        }),
      ),
    );
  }
}