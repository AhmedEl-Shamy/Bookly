
import 'package:flutter/material.dart';

import '../../../../../core/utlis/assets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: customTextFieldBorder(),
        focusedBorder: customTextFieldBorder(),
        hintText: 'Search',
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Image.asset(
            AssetsData.searchIcon,
            height: 24,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customTextFieldBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.75),
        ),
      );
  }
}