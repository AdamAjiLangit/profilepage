import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:profilepage/RegisterSecond.dart';
import 'dart:io';
import 'ProfilePage.dart';
import 'RegistrasiProfileController.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({Key? key}) : super(key: key);

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  late File? selectedImage = null;

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

  Widget myText(String label, String hintText, TextInputType inputType, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)), // Membuat sudut input sedikit melengkung
          ),
          contentPadding: EdgeInsets.all(15.0), // Menambahkan padding di dalam input
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
                  Image(image: AssetImage('Images/gambarlogin.png'),
                    width: 150, // Set your desired width here
                    height: 150,),
                  Text("Welcome, Make Your Account", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                  // myText("Username", "Ketik Username Anda", TextInputType.text, usernameController),
                  myText("Name", "Ketik Name Anda", TextInputType.name, nameController),
                  myText("Email", "Ketik Email Anda", TextInputType.emailAddress, emailController),
                  myText("Phone", "Ketik Phone Anda", TextInputType.phone, phoneController),
                  myText("Address", "Ketik Address Anda", TextInputType.streetAddress, addressController),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ...
                      ElevatedButton(
                        onPressed: () async {
                          // Menyimpan data ke controller sebelum navigasi
                          controller.registrasiProfile(
                            usernameController.text,
                            nameController.text,
                            emailController.text,
                            int.parse(phoneController.text),
                            addressController.text,
                            selectedImage != null ? selectedImage!.path : "", // Path gambar yang dipilih
                          );

                          // Navigasi ke halaman RegisterSecond
                          Get.to(() => RegisterSecond(username: usernameController.text, name: nameController.text, email: emailController.text, phone: phoneController.text, address: addressController.text, selectedImage: selectedImage))?.then((value) {
                            // Setelah kembali dari RegisterSecond, kosongkan inputan teks
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
                ],
              ),
            ),
          ]
      ),
    );
  }
}