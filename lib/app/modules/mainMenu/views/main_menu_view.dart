import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoseshop/app/utils/main_menu_model.dart';
import 'package:shoseshop/app/utils/main_menu_view_model.dart';

import '../controllers/main_menu_controller.dart';

class MainMenuView extends GetView<MainMenuController> {
  final List<MainMenuModel> _menus = MainMenuViewModel().getMainMenu();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          final MainMenuModel menu = _menus[index];
          return Column(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.center,
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    side: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    //todo
                    print("ok");
                  },
                  child: Image.network(
                    menu.image,
                    color: menu.color,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                menu.title,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ],
          );
        },
        itemCount: _menus.length,
      ),
    );
  }
}
