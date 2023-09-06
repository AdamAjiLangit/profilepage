import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:profilepage/ProfilePage.dart';

class RegisterSecond extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  final String phone;
  final String address;
  final File? selectedImage;

  const RegisterSecond({
    Key? key,
    required this.username,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.selectedImage,
  }) : super(key: key);

  @override
  _RegisterSecondState createState() => _RegisterSecondState();
}

class _RegisterSecondState extends State<RegisterSecond> {
  late File? selectedImage = null;
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengisi controller dengan data yang diterima
    usernameController.text = widget.username;
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    addressController.text = widget.address;
    selectedImage = widget.selectedImage;
  }

  void navigateToProfilePage() {
    if (selectedImage != null && usernameController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            selectedImage: selectedImage!,
            username: usernameController.text,
            name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            address: addressController.text,
          ),
        ),
      );
    } else {
      // Tampilkan pesan jika gambar atau username kosong
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'Silakan pilih gambar dan isi username terlebih dahulu.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker and Username'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImage != null
                ? Image.file(
              selectedImage!,
              width: 150,
              height: 150,
            )
                : Container(
              width: 150,
              height: 150,
              color: Colors.grey[300],
              child: Icon(Icons.camera_alt, size: 50),
            ),
            ElevatedButton(
              onPressed: () async {
                final pickedFile =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    selectedImage = File(pickedFile.path);
                  });
                }
              },
              child: Text('Pick Image'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: navigateToProfilePage,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }
}

