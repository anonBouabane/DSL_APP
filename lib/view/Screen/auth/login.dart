import 'package:dslsale/data/controller/auth_controller.dart';
import 'package:dslsale/message/loading.dart';
import 'package:dslsale/util/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
final _formKeydata = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(body: Consumer<AuthController>(
        builder: (context, value, child) {
          return Stack(
            children: [
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  Images.background,
                  fit: BoxFit.fill,
                ),
              ),
              Form(
                key: _formKeydata,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "username is required";
                            }
                            return null;
                          },
                          controller: username,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter username",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 7)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          controller: password,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter password",
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 7)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 80),
                      child: InkWell(
                        onTap: () async {
                          if (_formKeydata.currentState!.validate()) {
                            value.login(
                                username: username.text,
                                password: password.text);
                            loading(context);
                          }
                          // Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => const DashBoardScreen()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.blueAccent),
                          child: const Center(
                              child: Text(
                            "ເຂົ້າສູ່ລະບົບ",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      )),
    );
  }
}
