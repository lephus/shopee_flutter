import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoseshop/app/modules/product/product_model.dart';
import 'package:shoseshop/app/utils/product_view_model.dart';
import 'package:shoseshop/app/widgets/format.dart';

import '../controllers/product_controller.dart';

final List<ProductModel> _productViewModel = ProductViewModel().getProduct();
class ProductView extends GetView<ProductController> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(),
          _buildProductList(),
        ],
      ),
    );
  }

  Container _buildHeader() => Container(
    color: Colors.white,
    padding: const EdgeInsets.all(12),
    child: Text(
      "GỢI Ý HÔM NAY",
      style: TextStyle(
        color: Colors.deepOrange,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  Column _buildProductList() => Column(
    children: [
      GridView.builder(
        padding: EdgeInsets.all(6),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _productViewModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.75,
          crossAxisCount: 2,
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ProductItemCard(_productViewModel[index]);
        },
      ),
      false ? SizedBox(height: 150) : BottomLoader(),
    ],
  );
}

class ProductItemCard extends StatelessWidget {
  final ProductModel product;

  const ProductItemCard(this.product);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              _buildProductImage(constraints.maxHeight),
              _buildProductInfo(),
            ],
          ),
        );
      },
    );
  }

  Stack _buildProductImage(double maxHeight) {
    return Stack(
      children: <Widget>[
        Image.network(
          product.image,
          height: maxHeight - 82,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        if (product.discountPercentage != 0) _buildDiscount(),
        if (product.mall) _buildMall(),
        if (product.shopRecommended) _buildShopRecommended(),
      ],
    );
  }

  Positioned _buildDiscount() => Positioned(
    right: 0,
    child: Container(
      height: 180,
      width: 38,
      child: CustomPaint(
        painter: DiscountPainter(),
        size: Size(35, 180),
        child: Column(
          children: [
            SizedBox(height: 3),
            Text(
              "${product.discountPercentage}%",
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              "ลด",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Container _buildMall() => Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Color(0xffd0011b),
      borderRadius: BorderRadius.circular(2),
    ),
    child: Text(
      "mới",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    ),
  );

  Container _buildShopRecommended() => Container(
    padding: EdgeInsets.all(2),
    decoration: BoxDecoration(
      color: Colors.deepOrange,
      borderRadius: BorderRadius.circular(2),
    ),
    child: Text(
      "siêu sale",
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    ),
  );

  Padding _buildProductInfo() => Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        _buildName(),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPrice(),
            _buildSold(),
          ],
        ),
      ],
    ),
  );

  Text _buildName() => Text(
    product.name,
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );

  RichText _buildPrice() => RichText(
    text: TextSpan(
      text: '\$ ',
      style: TextStyle(
        color: Colors.deepOrange,
        fontSize: 12,
      ),
      children: <TextSpan>[
        TextSpan(
          text: '${Format().currency(product.price, decimal: false)}',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );

  Text _buildSold() => Text(
    "đã bán ${product.sold}",
    style: TextStyle(
      fontSize: 10,
    ),
  );
}
class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 22),
      width: double.infinity,
      alignment: Alignment.center,
      child: Center(
        child: Text(
          "loading...",
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
class DiscountPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 5.5,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    final paint = Paint();
    paint.color = Color(0xfffcd511);
    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}