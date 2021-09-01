import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: Colors.orange[800],
        accentColor: Colors.orange[600],

        // Define the default font family.
        fontFamily: 'Georgia',
      ),
    ),
  );
}
