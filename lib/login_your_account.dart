import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:signin_portal/signin_screen.dart';

import 'constant/color_constant.dart';
import 'constant/string_constant.dart';
class LoginYourAccount extends StatefulWidget {
  const LoginYourAccount({Key? key}) : super(key: key);

  @override
  State<LoginYourAccount> createState() => _LoginYourAccountState();
}

class _LoginYourAccountState extends State<LoginYourAccount> {

  int currentIndex = 0;
  final List item=[
    {
      'title':'Connect with people around the world',
      'image': 'assets/image4.jpg',
      'subtitle': 'User will be able to go live, chat and meet with people near by.',
    },
    {
      'title': "Let's build connection with new peoples.",
      'image': 'assets/image5.jpg',
      'subtitle': 'Connect helps you locate the people around you who are closest from your home town!',
    },
    {
      'title':'Feel the happiness and meet with people near by',
      'image': 'assets/image6.jpg',
      'subtitle': 'User will be able to go live, chat and meet with people near by.',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstant.loginaccount,
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorConstant.textboldColor,
                    )
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                        },
                      height: 500,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      reverse: false,
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: item.map((items) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 1),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item[currentIndex]['title'],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstant.textboldColor
                                ),),
                              const SizedBox(height: 30),
                              ClipRRect(borderRadius: BorderRadius.circular(10),
                                child: Image.asset(item[currentIndex]['image'],
                                    height: 350,
                                    width: double.infinity,
                                    fit: BoxFit.cover),
                              ),
                              const SizedBox(height: 20),
                              Text(item[currentIndex]['subtitle'],textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                    color: ColorConstant.iconColor
                                ),),

                            ],
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < item.length; i++)
                      buildIndicator(currentIndex == i)
                  ],
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child:currentIndex ==2?InkWell(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                  },
                    child: Center(
                      child: Container(height: 50,width: 200,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorConstant.iconColor
                      ),
                          child: Center(child: Text(StringConstant.getstart,style: TextStyle(
                            color: ColorConstant.white
                          ),))),
                    ),
                  ):Row(
                    children: [
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                        },
                          child: Text(StringConstant.skip,style: TextStyle(
                            color: ColorConstant.iconColor
                          ),)),
                      const Spacer(),
                      InkWell(onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                        },
                          child: Text(StringConstant.next,style: TextStyle(
                            color: ColorConstant.iconColor
                          ),))
                    ],
                  ))
              ],
            ),
          )
      ),
    );
  }
  Widget buildIndicator(bool currentIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: 12,
        width: 12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentIndex ? ColorConstant.iconColor : ColorConstant.gray,
        ),
      ),
    );
  }
}
