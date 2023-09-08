import 'dart:typed_data';

import 'package:get/get.dart';

class RegistrasiProfileController extends GetxController {
  final resultData = RxString("initial");
  final RxString txtUsername = RxString("");
  final RxString txtName = RxString("");
  final RxString txtEmail = RxString("");
  final RxString txtPhone = RxString("");
  final RxString txtAddress = RxString("");
  final RxString txtPassword = RxString("");

  void resultRegister(
      String txtUsername,
      String txtName,
      String txtEmail,
      String txtPhone,
      String txtAddress,
      String txtPassword,
      ) {
    resultData.value = "Registration Success";
    print("Profile Page " + resultData.value.toString());
  }

  void registrasiProfile(
      String txtUsername,
      String txtName,
      String txtEmail,
      String txtPhone,
      String txtAddress,
      String txtPassword,
      Uint8List? image,
      ) {
      this.txtUsername.value = txtUsername;
      this.txtName.value = txtName;
      this.txtEmail.value = txtEmail;
      this.txtAddress.value = txtAddress;
      this.txtPhone.value = txtPhone;
      this.txtPassword.value = txtPassword;
  }
}
