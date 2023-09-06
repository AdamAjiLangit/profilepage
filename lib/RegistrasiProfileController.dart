import 'package:get/get.dart';

class RegistrasiProfileController extends GetxController {
  // Buat variabel-variabel yang akan digunakan untuk menyimpan data profil pengguna
  RxString txtUsername = ''.obs;
  RxString txtName = ''.obs;
  RxString txtEmail = ''.obs;
  RxString txtPhone = ''.obs;
  RxString txtAddress = ''.obs;
  RxString imageView = ''.obs;

  // Metode untuk menyimpan data profil pengguna
  void registrasiProfile(String username, String name, String email, int phone, String address, String image) {
    txtUsername.value = username;
    txtName.value = name;
    txtEmail.value = email;
    txtPhone.value = phone.toString();
    txtAddress.value = address;
    imageView.value = image;
    // Anda juga dapat menambahkan logika untuk mengelola gambar di sini jika diperlukan.
  }
}
