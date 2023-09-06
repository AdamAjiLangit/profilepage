import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'RegistrasiProfileController.dart';

class ProfilePage extends StatefulWidget {

  final File? selectedImage;

  const ProfilePage({Key? key, this.selectedImage}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late File? selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = widget.selectedImage;
  }

  final RegistrasiProfileController controller = Get.put(RegistrasiProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
                  () => Text("Username : " + controller.txtUsername.value,
              ),
            ),
            Obx(
                  () => Text("Name : " + controller.txtName.value,
              ),
            ),
            Obx(
                  () => Text("Email : " + controller.txtEmail.value,
              ),
            ),
            Obx(
                  () => Text("Phone : " + controller.txtPhone.value,
              ),
            ),
            Obx(
                  () => Text("Address : " + controller.txtAddress.value,
              ),
            ),
            // Tampilkan gambar yang dipilih
            Obx(() {
              return selectedImage != null
                  ? Image.file(selectedImage!)
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}