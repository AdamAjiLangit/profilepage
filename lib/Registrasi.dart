import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'ProfilePage.dart';
import 'RegistrasiProfileController.dart';
import 'imagePicker.dart';
import 'textFrom.dart';

class Registrasi extends StatefulWidget {
  const Registrasi({super.key, required String title});

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  Uint8List? _image;
  final RegistrasiProfileController controller = Get.put(RegistrasiProfileController());
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController nameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  bool _isObsecure = true;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    passwordController = TextEditingController();
  }
  
  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void signUpFunction(Uint8List? image) {
    if (nameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        addressController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Warning"),
            content: Text("Please enter your data!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      controller.registrasiProfile(
        nameController.text,
        usernameController.text,
        phoneController.text,
        addressController.text,
        emailController.text,
        passwordController.text,
        _image,
      );
      Get.to(() => ProfilePage(
        image: _image,
      ));
    }
  }

  void _toggleObsecure(bool isObsecure) {
    setState(() {
      _isObsecure = isObsecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(29, 53, 87, 1.000),
      body: Stack(
        children: [
        // Background Image
        Image.asset(
        'Images/BackgroundBlue.jpg', // Replace with your image asset path
        fit: BoxFit.cover, // Adjust the fit as needed
        width: double.infinity,
        height: double.infinity,
      ),
      SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.app_registration_outlined,
                        size: 40,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                              : CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 64,
                            backgroundImage: NetworkImage('_image'),
                          ),
                          Positioned(
                              child: IconButton(
                                onPressed: _selectImage,
                                icon: Icon(
                                  Icons.add_a_photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              bottom: 33,
                              left: 29),
                        ],
                      ),
                    ],
                  ),
                ),
                signUpForm("Name", "Name", false, false,
                    controller: nameController,
                ),
                signUpForm("Username", "Username", false, false,
                    controller: usernameController),
                signUpForm("Phone Number", "08x", false, false,
                    controller: phoneController),
                signUpForm(
                    "Address", "Address", false, false,
                    controller: addressController),
                signUpForm("Email", "example@xample.com", false, true,
                    controller: emailController),
                TextFormField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  obscureText: _isObsecure, // Use the 'isObscure' variable here
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(121, 138, 153, 1.000)),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObsecure = !_isObsecure;
                        });
                      },
                      child: Icon(
                        // Show an eye icon to toggle password visibility
                        _isObsecure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: ElevatedButton(
                      onPressed: () {
                        signUpFunction(_image);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.cyan,
                        minimumSize: const Size(double.infinity, 45),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    ])
    );
  }
}