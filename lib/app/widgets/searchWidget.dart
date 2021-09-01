import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: TextField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(4),
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
            color: Colors.black,
          ),
          prefixIconConstraints: sizeIcon,
          suffixIcon: Icon(
            MdiIcons.cameraOutline,
            color: Colors.black,
          ),
          suffixIconConstraints: sizeIcon,
        ),
      ),
    );
  }
  final sizeIcon = BoxConstraints(
    minWidth: 40,
    minHeight: 40,
  );
  final border = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
    borderRadius: const BorderRadius.all(
      const Radius.circular(2.0),
    ),
  );
}