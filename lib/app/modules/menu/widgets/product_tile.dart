import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/widgets/formatter_helper.dart';
import 'package:vakinha_burger/app/core/vakinha_ui.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:get/get.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/product_detail', arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://dartweek.academiadoflutter.com.br/images${product.image}'),
                      fit: BoxFit.cover),
                )),
            Expanded(
                child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: Column(
                // Alinhar da esqueda para a direita
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(product.name, style: VakinhaUI.textBold),
                  Text(
                    FormatterHelper.formatCurrency(product.price),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
