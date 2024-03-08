import 'package:flutter/material.dart';
import 'package:mradithyan_motionintern_challange/widget/custom_field.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 243, 1),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: const Color.fromRGBO(98, 193, 114, 1),
            width: double.infinity,
            height: 80,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/profilePage');
                      },
                    ),
                    SizedBox(width: 50),
                    Text(
                      'Ubah Profil',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ],
                )),
          ),
          SizedBox(height: 50),
          Container(
            width: 80,
            height: 80,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profilePict.png'),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomField(
                    header: 'header',
                    onSubmit: (value) {},
                    value: 'Natalie Diva',
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
