import 'package:profilepage/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";

  Widget myText (String label, bool isObscure) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: label,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(

            children: [
              Column(
                children: [
                  Image(
                    image: AssetImage('Images/img_loginPage.png'),
                    width: 200, // Set your desired width here
                    height: 275,
                  ),
                ],
              ),
              myText("Username", false),
              myText("Password", true),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                      child: Text("Login")),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: () {}, child: Text("Register",)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
