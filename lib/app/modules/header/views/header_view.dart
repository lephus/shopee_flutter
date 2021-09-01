import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../controllers/header_controller.dart';

class HeaderView extends GetView<HeaderController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: Container(
              color: Colors.orange[800],
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearch(),
                      SizedBox(width: 8),
                      _buildIconButton(
                        onPressed: () => print("click"),
                        icon: MdiIcons.cartOutline,
                        notification: 20,
                      ),
                      _buildIconButton(
                        onPressed: () => print("click"),
                        icon: MdiIcons.chatProcessingOutline,
                        notification: 9,
                      ),
                    ],
                  ),
                ),
              ),
            ),
      );
  }


  Stack _buildIconButton({
    VoidCallback onPressed,
    IconData icon,
    int notification = 0,
  }) =>
      Stack(
        children: <Widget>[
          IconButton(
            iconSize: 28,
            onPressed: onPressed,
            icon: Icon(icon),
            color: controller.colorIcon,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white),
              ),
              constraints: BoxConstraints(
                minWidth: 22,
                minHeight: 22,
              ),
              child: Text(
                '$notification',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      );
  Expanded _buildSearch() {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    );

    final sizeIcon = BoxConstraints(
      minWidth: 40,
      minHeight: 40,
    );

    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          focusedBorder: border,
          enabledBorder: border,
          isDense: true,
          hintText: "Shopee",
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.deepOrange,
          ),
          prefixIcon: Icon(
            Icons.search,
          ),
          prefixIconConstraints: sizeIcon,
          suffixIcon: Icon(
            MdiIcons.cameraOutline,
          ),
          suffixIconConstraints: sizeIcon,
          filled: true,
          fillColor: controller.backgroundColorSearch,
        ),
      ),
    );
  }
}
