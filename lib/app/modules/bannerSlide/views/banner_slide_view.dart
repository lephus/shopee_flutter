import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/banner_slide_controller.dart';
final List<String> imgList = [
  "https://cf.shopee.vn/file/641f60c16cba7c75e0c355baa9e548b6",
  "https://www.phanmemninja.com/wp-content/uploads/2019/12/cach-ban-hang-tren-shopee-mall-1-1-768x432.jpg",
  "https://storage.googleapis.com/ops-shopee-files-live/live/affiliate-blog/2020/10/cach-ban-hang-tren-shopee.jpg",
  "https://inboundmarketing.vn/wp-content/uploads/2020/08/tuyet-chieu-lam-tang-gap-doi-doanh-thu-ban-hang-tren-shopee-mua-dich-1.jpg",
  "https://thehekhoinghiep.com/wp-content/uploads/2018/09/Cach-ban-hang-tren-Shopee-hieu-qua-nhat-2.jpg",
  "https://suno.vn/blog/wp-content/uploads/2021/01/phi-thanh-toan-shopee-thumb-1593577116904-1400x695.jpg"
];
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
          items: imgList
              .map(
                (item) => Image.network(
              item,
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
                title: "Ví ShoppePay",
                subTitle: "Voucher giảm 100k9Liên kết Ví ShopeePay ngay",
              ),
              verticalDivider,
                _buildInfo(
                  image:
                  "https://www.pngrepo.com/png/167109/180/dollar-coin-circle-with-symbol.png",
                  title: "0 Xu",
                  subTitle: "Đến trang săn xu ngay",
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
