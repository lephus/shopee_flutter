import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Shopee.svg/800px-Shopee.svg.png"),
                ),
                SizedBox(height: 26.0,),
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: controller.emailTextEditController,
                      ),
                      SizedBox(height: 16.0,),
                      TextField(
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        controller: controller.passwordTextEditController,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.0,),
                Container(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    alignment: Alignment.topRight,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () { },
                      child: Text('Forgot your password ?'),
                    )
                ),
                SizedBox(height: 12.0,),
                Obx(() {
                  return Container(
                    width: 250.0,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                          controller.isLoading.value == true
                              ? 'Processing...'
                              : 'Login'),
                      onPressed: () {
                        if(controller.isLoading.value==false){
                          controller.actionLogin(controller.emailTextEditController.text.trim(), controller.passwordTextEditController.text.trim());
                        }
                      },
                    ),
                  );
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("you not have an account ? ", style: TextStyle(fontSize: 16.0),),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                      ),
                      onPressed: () { displayCustomerRegisterWindow(); },
                      child: Text('Register now.', style: TextStyle(fontSize: 16.0),),
                    )
                  ],
                )
              ]
          )
      ),
    );
  }

  void displayCustomerRegisterWindow() {
    controller.clearTextEditingControllers();
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          color: Colors.white,
        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Full name',
                        hintText: 'Enter your full name...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.fullNameTextEditController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        hintText: 'Enter your address...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.addressTextEditController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Age',
                        hintText: 'Enter your age...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.ageTextEditController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.emailTextEditController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.passwordTextEditController,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        hintText: 'Comfirm password your input...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller: controller.confirmPasswordTextEditController,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() {
                          return RaisedButton(
                            color: Colors.green[800],
                            textColor: Colors.white,
                            child: Text(
                                controller.isLoading.value == true
                                    ? 'Processing...'
                                    : 'Register'),
                            onPressed: () {
                              if (controller.isLoading.value == false) {
                                controller.actionRegister(
                                    "",
                                    controller.fullNameTextEditController.text,
                                    controller.addressTextEditController.text,
                                    controller.ageTextEditController.text,
                                    controller.emailTextEditController.text,
                                    controller.passwordTextEditController.text,
                                    controller.confirmPasswordTextEditController.text);
                                Get.back();
                              }
                            },
                          );
                        })
                      ],
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
