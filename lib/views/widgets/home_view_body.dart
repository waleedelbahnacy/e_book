import 'package:e_book/core/utils/assets.dart';
import 'package:e_book/views/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:const [
   CustomAppBar(),
   CustomListViewItem(),
      ],
    );
  }
}

