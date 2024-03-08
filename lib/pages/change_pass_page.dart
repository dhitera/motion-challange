import 'package:flutter/material.dart';
import 'package:mradithyan_motionintern_challange/widget/custom_field.dart';

class ChangePassPage extends StatelessWidget {
  const ChangePassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 243, 1),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Ubah Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  )),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      CustomField(
                        header: 'Password Lama',
                        onSubmit: (value) {},
                      ),
                      CustomField(
                        header: 'Password Baru',
                        onSubmit: (value) {},
                      ),
                      CustomField(
                        header: 'Konfirmasi Password Baru',
                        onSubmit: (value) {},
                      ),
                      SizedBox(height: 350),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Simpan',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(116, 218, 116, 1),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
