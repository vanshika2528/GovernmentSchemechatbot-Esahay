import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../screen/chatbot.dart';

class LoginController extends GetxController {
  final nameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  // final UserController userController = Get.put(UserController());
  RxBool loading = false.obs;
  RxString username = ''.obs;

  // Logout function
  void logout() {
    // Clear the user credentials
    username.value = '';
    clearCredentials();

    // Optionally, clear other session-related data (e.g., token, user info)

    // Navigate to login screen
    Get.offAllNamed(
        '/login'); // Replace with your actual login route/ Replace '/login' with your actual login route
  }

  void loginApi() async {
    try {
      loading.value = true;
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: jsonEncode(
          {
            'username': nameController.value.text,
            'password': passwordController.value.text,
          },
        ),
        headers: {'Content-Type': 'application/json'},
      );

      var data = jsonDecode(response.body);
      print(data);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        loading.value = false;
        username.value = data['username'];
        Get.back();
        Get.snackbar(
          'Login Successfull',
          'Welcome ${username.value}',
          colorText: Colors.white,
          backgroundColor: Colors.green,
        );
        // userController.setUsername(username.value);
        Get.offNamed('/chat');
      } else {
        loading.value = false;
        Get.snackbar(
          'Login Failed',
          'please enter correct password',
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Exception',
        e.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }

  void clearCredentials() {
    nameController.value.clear();
    passwordController.value.clear();
  }
}
