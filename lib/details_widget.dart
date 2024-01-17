import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(
        width: 450,
        height: 300,
        child: Card(
          elevation: 10,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.transparent.withOpacity(0.5),
          borderOnForeground: true,
          margin: const EdgeInsets.all(20),
          clipBehavior: Clip.antiAlias,
          semanticContainer: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DetailsWidget(),
            ],
          ),
        ),
      ),
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
