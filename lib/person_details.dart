import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ui/person_relation.dart';

class PersonDetails extends StatelessWidget {
  const PersonDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFDF7E4), // Use the provided color
        title: const Text('Person Details'),
      ),
      body: Container(
        decoration:BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: [
              Color(0xFFE8D3FF),
              Color(0xFFFFDEDE),
            ],
          ),

        ) ,
        child: ListView(
          children: [
            _buildCard('تفاصيل المستخدم', _buildUserInfoCard()),
            _buildCard('العلاقات', _buildRelationshipsPageView()),
            _buildCard('المرفقات', _buildAttachmentsCard()),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, Widget child) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 10,
        shadowColor: Colors.black,
        surfaceTintColor:Color(0xFFDFDFDF),
        borderOnForeground: true,
        margin: const EdgeInsets.all(20),
        clipBehavior: Clip.antiAlias,
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoCard() {
    return Container(
      //height: 400,
      child: const UserInfo(),
    );
  }

  Widget _buildRelationshipsPageView() {
    return SizedBox(
      height: 300,
      child: ListView.builder(

        itemExtent: 390,
        itemBuilder: (BuildContext context, int index) {
          return const PersonsRelation();
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildAttachmentsCard() {
    return SizedBox(
      height: 450,
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
        child: Center(
          child: SvgPicture.asset(
            'assets/images/logo_one.svg',
            height: 80,
            color: Colors.black,
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUserInfoRow('أنور صافي : ', 'الاسم'),
          _buildUserInfoRow('301010101011 : ', 'الرقم القومي'),
          _buildUserInfoRow('01010101101010 : ', 'رقم الهاتف'),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                maxLines: 10,
                ':الوصف',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[600]),
              ),
            ],
          ),
          const Text(
            'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoRow(String text, String text1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          text1,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
