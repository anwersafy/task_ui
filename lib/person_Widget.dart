import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Persons extends StatelessWidget {
  const Persons({super.key});


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
       context.go('/persons/person_details');
      },
      borderRadius: BorderRadius.circular(20),
      child: Center(
          child: SizedBox(
            width: 450,
            height: 300,
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              surfaceTintColor: Colors.red.withOpacity(0.5),
              borderOnForeground: true,
              margin: const EdgeInsets.all(20),
              clipBehavior: Clip.antiAlias,
              semanticContainer: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const UserInfo(),
                ],
              ),
            ),
          ),
        ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SvgPicture.asset('assets/images/logo_one.svg', height: 80,color: Colors.black,),
        ),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [


            _buildUserInfoRow('أنور صافي : ', 'الاسم'),
            _buildUserInfoRow('301010101011 : ', 'الرقم القومي'),
            _buildUserInfoRow('01010101101010 : ', 'رقم الهاتف'),
            _buildUserInfoRow('القاهره : ', 'العنوان'),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(String text,String text1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              text1,
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w300,color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}
