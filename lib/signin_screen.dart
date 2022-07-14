import 'package:flutter/material.dart';
import 'package:signin_portal/constant/color_constant.dart';
import 'package:signin_portal/constant/string_constant.dart';
import 'package:signin_portal/create_account.dart';
import 'package:signin_portal/validator.dart';
import 'package:signin_portal/welcome_screen.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateAccount()));
                        },
                            child: const Icon(Icons.arrow_back)),
                        const SizedBox(),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text(StringConstant.signin,style: const TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold
                    )),
                    const SizedBox(height: 40),
                    TextFormField(
                      validator: Validate.validateUserNameAddress,
                      decoration: InputDecoration(
                        labelText: StringConstant.username
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: Validate.validatePasswordAddress,
                      decoration: InputDecoration(
                       labelText: StringConstant.password
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Icon(Icons.square_outlined),
                        const SizedBox(width: 5),
                        Text(StringConstant.reminder),
                        const Spacer(),
                        Text(StringConstant.forget,style: TextStyle(
                          color: ColorConstant.iconColor
                        )),
                      ],
                    ),
                    const SizedBox(height: 50),
                    InkWell(onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                      }
                    },
                      child: Container(height: 50,width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ColorConstant.iconColor,
                        ),
                        child: Center(child: Text(StringConstant.login,style: TextStyle(
                          color: ColorConstant.white
                        ),)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(StringConstant.newuser),
                        const SizedBox(width: 5),
                        Text(StringConstant.signup,style: TextStyle(
                          color: ColorConstant.iconColor
                        ),)
                      ],
                    )

                  ],
                ),
              ),
            )),
      ),
    );
  }
}
