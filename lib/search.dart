import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xFFE8D3FF),
                Color(0xFFFFDEDE),
              ],
            ),
            color: Color(0xFF71C9CE),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/logo_one.svg',
                  height: 100,
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: AuthTextFromField(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await Future.delayed(const Duration(seconds: 2));
                              setState(() {
                                isLoading = false;
                              });
                            }
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                        hintText: 'ابحث عن شئ',
                        obscureText: false,
                        controller: searchController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'هذا الحقل مطلوب';
                          } else {
                            return null;
                          }
                        },
                        textInputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomContaner(
                      text: 'المواقع',
                      image: 'assets/images/logo_one.svg',
                    ),
                    CustomContaner(
                      text: 'المواقع',
                      image: 'assets/images/logo_one.svg',
                    ),
                    CustomContaner(
                      text: 'المواقع',
                      image: 'assets/images/logo_one.svg', // <-- Fix: Add a closing quote here
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomContaner extends StatelessWidget {
  final String text;
  final String image;

  const CustomContaner({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/persons');

      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width * 0.08,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: 30,
              color: Colors.black,
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Function validator;
  final TextInputType textInputType;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color? inputColor;

  AuthTextFromField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.hintText,
    required this.textInputType,
    this.prefixIcon,
    this.inputColor,
    required this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: const Color(0xffD0D0D0),
        style: TextStyle(
          color: inputColor ?? const Color(0xff3A3A3A).withOpacity(.8),
        ),
        keyboardType: textInputType,
        validator: (value) => validator(value),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: inputColor ?? const Color(0xffB7B7B7),
            fontSize: 13,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffD0D0D0),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
