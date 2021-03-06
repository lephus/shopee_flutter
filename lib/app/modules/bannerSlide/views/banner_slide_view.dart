import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/banner_slide_controller.dart';
class BannerSlideView extends GetView<BannerSlideController> {
  @override
  Widget build(BuildContext context) {
    final verticalDivider = VerticalDivider(
      indent: 5,
      endIndent: 5,
      thickness: 1.5,
      width: 24,
      color: Colors.grey[300],
    );
    return Stack(
      clipBehavior: Clip.none, alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 40),
          child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.873,
            viewportFraction: 1.0,
            autoPlay: true,
          ),
          items: controller.imgList
              .map(
                (item) => Image.network(
              item.toString(),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ).toList(),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 7,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              SizedBox(width: 4),
              Expanded(
                child: Image.network(
                  "https://cdn1.iconfinder.com/data/icons/business-shop-finance-symbols-set-3/91/Business_-_Shop_-_Finance_137-512.png",
                  height: 45,
                  color: Colors.black54,
                ),
              ),
              verticalDivider,
              _buildInfo(
                image:"",
                title: "V?? ShoppePay",
                subTitle: "Voucher gi???m 100k9Li??n k???t V?? ShopeePay ngay",
              ),
              verticalDivider,
                _buildInfo(
                  image:
                  "https://www.pngrepo.com/png/167109/180/dollar-coin-circle-with-symbol.png",
                  title: "0 Xu",
                  subTitle: "?????n trang s??n xu ngay",
                  isCoin: true,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Expanded _buildInfo({
  String image,
  String title,
  String subTitle,
  bool isCoin = false,
}) {
  final height = 22.0;
  return Expanded(
    flex: 3,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: height,
          child: Row(
            children: [
              Image.network(
                image,
                height: isCoin ? height - 7.0 : null,
                color: isCoin ? Colors.amber : null,
              ),
              SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[700],
          ),
          maxLines: 2,
        ),
      ],
    ),
  );
}
