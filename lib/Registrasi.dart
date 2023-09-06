import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'ProfilePage.dart';
import 'RegistrasiProfileController.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  late File? selectedImage;

  final RegistrasiProfileController controller = Get.put(RegistrasiProfileController());

  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    imageController = TextEditingController();
  }

  Widget myText(String label, String hintText, TextInputType InputType, TextEditingController controller){
    return Container(
      margin: EdgeInsets.all(20),
      child: TextField(
        //memberikan Password untuk setiap form
        controller: controller,
        keyboardType: InputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          labelText: label,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrasi Page"),),
      body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/your_image.png', width: 100, height: 100),
                  Text("Registrasi", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  myText("Username", "Ketik Username Anda", TextInputType.text, usernameController),
                  myText("Name", "Ketik Name Anda", TextInputType.name, nameController),
                  myText("Email", "Ketik Email Anda", TextInputType.emailAddress, emailController),
                  myText("Phone", "Ketik Phone Anda", TextInputType.phone, phoneController),
                  myText("Address", "Ketik Address Anda", TextInputType.streetAddress, addressController),

                  ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          selectedImage = File(pickedFile.path);
                        });
                      }
                    },
                    child: Text('Pick Image'),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      // Menyimpan data ke controller sebelum navigasi
                      controller.registrasiProfile(
                        usernameController.text,
                        nameController.text,
                        emailController.text,
                        int.parse(phoneController.text),
                        addressController.text,
                        imageController.text,
                      );

                      // Navigasi ke halaman ProfilePage
                      Get.to(() => ProfilePage())?.then((value) {
                        // Setelah kembali dari ProfilePage, kosongkan inputan teks
                        usernameController.clear();
                        nameController.clear();
                        emailController.clear();
                        phoneController.clear();
                        addressController.clear();
                      });
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ]
      ),
    );
  }
}