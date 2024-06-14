import 'package:e_book/core/utils/functions/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomeUrl(context, String? url )async{
  if (url !=null) {
  Uri uri = Uri.parse(url);
  if (await launchUrl(uri)) { 
  await launchUrl(uri);
  }else
  {
  customSnackBar(context, 'cannot launch $url');
  }
}
}

