import 'package:e_book/core/utils/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessage,style: Styles.textStyle18,
    );
  }
}