import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({
    required this.header,
    required this.onSubmit,
    this.controller,
    this.value,
    super.key,
  });

  final String header;
  String? value;
  final TextEditingController? controller;
  final Function(String) onSubmit;

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
          TextFormField(
            controller: controller,
            onFieldSubmitted: onSubmit,
            initialValue: value,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
