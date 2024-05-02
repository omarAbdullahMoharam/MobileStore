import 'package:flutter/material.dart';
import 'package:mobile_app/dashboard/modules/products/model/Product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.mobilePhones});
  final ProductModel mobilePhones;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mobilePhones.name ?? 'XXX',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              mobilePhones.address ?? 'XXX',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
