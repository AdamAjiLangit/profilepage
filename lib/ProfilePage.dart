import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:profilepage/HomePage.dart';
import 'RegistrasiProfileController.dart';
import 'textFrom.dart';

class ProfilePage extends StatelessWidget {
  final RegistrasiProfileController controller = Get.find();
  final Uint8List? image;

  ProfilePage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent, // Make the app bar transparent
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true, // Extend the background behind the app bar
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("Images/BackgroundBlue.jpg"), // Replace with your image asset
            fit: BoxFit.cover, // You can adjust the fit as needed
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            color: Colors.black.withOpacity(0.5), // Add a semi-transparent black overlay
            child: Column(
              children: [
                SizedBox(height: 100),
                image != null
                    ? CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(image!),
                )
                    : CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.grey,
                ),
                SizedBox(height: 15),
                buildInfoBox("Name : ", controller.txtName.value),
                buildInfoBox("Username : ", controller.txtUsername.value),
                buildInfoBox("Phone : ", controller.txtPhone.value),
                buildInfoBox("Address : ", controller.txtAddress.value),
                buildInfoBox("Email : ", controller.txtEmail.value),
                buildInfoBox("Password : ", controller.txtPassword.value),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.cyan,
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      child: const Text(
                        "Homepages",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}