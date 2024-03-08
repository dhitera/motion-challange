import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Produk extends StatelessWidget {
  const Produk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromRGBO(78, 154, 91, 1),
              width: double.infinity,
              height: 136,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    Text(
                      'List Produk',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 55,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari Produk',
                          hintStyle: TextStyle(fontSize: 17),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal:
                                  15), // Adjust vertical padding to center the text
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: 33,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('produk')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('Sedang Loading');
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Wrap(
                        spacing: 7,
                        runSpacing: 11,
                        children: [
                          for (var documents in snapshot.data!.docs)
                            CardItem(
                              id: documents.id,
                              namaProduk: documents.data()['namaProduk'],
                              status: documents.data()['status'],
                            )
                        ],
                      );
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    required this.id,
    required this.namaProduk,
    required this.status,
    super.key,
  });

  final String id;
  final String namaProduk;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 173,
            height: 96,
            color: Color.fromRGBO(209, 243, 209, 1),
            child: Image.asset(
              'assets/images/bayem.png',
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namaProduk,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                Container(
                  child: Text(
                    status,
                    style: TextStyle(
                        fontSize: 12,
                        color: status == 'Proses' ? Colors.orange : Colors.red,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90),
            child: Container(
              color: const Color.fromRGBO(116, 218, 116, 1),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              child: Text(
                'Detail',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
