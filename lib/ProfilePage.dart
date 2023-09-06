import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'RegistrasiProfileController.dart';

class ProfilePage extends StatelessWidget {
  final File selectedImage;
  final String username;
  final String name;
  final String email;
  final String phone;
  final String address;

  // Tambahkan parameter name, email, phone, dan address dalam konstruktor
  const ProfilePage({
    Key? key,
    required this.selectedImage,
    required this.username,
    required this.name, // Tambahkan parameter name
    required this.email, // Tambahkan parameter email
    required this.phone, // Tambahkan parameter phone
    required this.address, // Tambahkan parameter address
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              selectedImage,
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text('Username: $username'),
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Phone: $phone'),
            Text('Address: $address'),
          ],
        ),
      ),
    );
  }
}