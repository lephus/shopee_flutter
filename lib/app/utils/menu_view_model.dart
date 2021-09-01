import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shoseshop/app/utils/menu_model.dart';

class MenuViewModel {
  List<MenuModel> getMenus() {
    return [
      MenuModel(
        icon: MdiIcons.homeOutline,
        iconSelected: Icons.thumb_up,
        label: "Mới nhất",
      ),
      MenuModel(
        icon: Icons.filter_none,
        iconSelected: Icons.filter_none,
        label: "Feed",
      ),
      MenuModel(
        icon: MdiIcons.videoOutline,
        iconSelected: MdiIcons.video,
        label: "Shopee Live",
      ),
      MenuModel(
        icon: MdiIcons.bellOutline,
        iconSelected: MdiIcons.bell,
        label: "Thông báo",
      ),
      MenuModel(
        icon: MdiIcons.accountOutline,
        iconSelected: MdiIcons.account,
        label: "Tôi",
      ),
    ];
  }
}
