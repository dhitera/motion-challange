import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 250, 243, 1),
      body: SafeArea(
          child: SingleChildScrollView(
        child: FutureBuilder(
            future:
                FirebaseFirestore.instance.collection('profil').limit(1).get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Text('Data tidak tersedia!');
              }
              var document = snapshot.data!.docs.first;
              var data = document.data() as Map<String, dynamic>;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: const Color.fromRGBO(98, 193, 114, 1),
                    width: double.infinity,
                    height: 136,
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 70,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/profilePict.png'),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    data['email'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            IconButton(
                                icon: Icon(
                                  Icons.edit_note,
                                  size: 30,
                                ),
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/editProfile');
                                })
                          ],
                        )),
                  ),
                  SizedBox(height: 30),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: ProfileValue(
                        id: document.id,
                        nama: data['nama'] ?? '',
                        email: data['email'] ?? '',
                        noTelp: data['telp'] ?? '',
                        alamat: data['alamat'] ?? '',
                      ))
                ],
              );
            }),
      )),
    );
  }
}

class ProfileValue extends StatelessWidget {
  const ProfileValue({
    super.key,
    required this.id,
    required this.nama,
    required this.email,
    required this.noTelp,
    required this.alamat,
  });

  final String id;
  final String nama;
  final String email;
  final String noTelp;
  final String alamat;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileData(header: 'Nama Lengkap', value: nama),
          ProfileData(header: 'Email', value: email),
          ProfileData(header: 'No. Telepon', value: noTelp),
          ProfileData(header: 'Alamat', value: alamat),
          Text(
            'Keamanan',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 7),
          Row(
            children: [
              Text(
                'Ubah Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, '/changePass');
                },
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.exit_to_app_rounded,
                color: Color.fromRGBO(18, 155, 41, 1),
              ),
              SizedBox(width: 10),
              Text(
                'Logout Akun',
                style: TextStyle(
                    fontSize: 18, color: Color.fromRGBO(18, 155, 41, 1)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProfileData extends StatelessWidget {
  const ProfileData({
    required this.header,
    required this.value,
    super.key,
  });

  final String header;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 7),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
