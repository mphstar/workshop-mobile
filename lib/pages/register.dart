// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class registerPage extends StatelessWidget {
  RxBool _isObscure = true.obs;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: (MediaQuery.of(context).size.width),
        height: (MediaQuery.of(context).size.height),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 43,
              ),
              Center(
                  child: Image.asset(
                "img/image.png",
                height: 162,
                width: 170,
              )),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color(0xff535353),
                  fontSize: 24,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: Text(
                  "Please enter the details below a continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff8d7c7c),
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: 315,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff0f0f0),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                width: 315,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff0f0f0),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Container(
                width: 315,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xfff0f0f0),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: Color(0xff9f9f9f),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Color(0xff9f9f9f),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Container(
                      width: 315,
                      height: 47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xfff0f0f0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 50, 0),
                        child: Obx(
                          () => TextField(
                            obscureText: _isObscure.value,
                            controller: _passwordController,
                            decoration: const InputDecoration.collapsed(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Color(0xff9f9f9f),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Color(0xff9f9f9f),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(280, 0, 10, 5),
                    child: Obx(
                      () => TextButton.icon(
                          onPressed: () {
                            _isObscure.value = !_isObscure.value;
                          },
                          icon: Icon(
                            _isObscure.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff9f9f9f),
                          ),
                          label: const Text("")),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height) - 680,
              ),
              Container(
                width: 157,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffee4848),
                ),
                child: TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Color(0xff767676),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xffEE4848),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
