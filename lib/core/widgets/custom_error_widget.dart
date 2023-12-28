import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget(this.errorMsg,{super.key});
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMsg),
    );
  }
}