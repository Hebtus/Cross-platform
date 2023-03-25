// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/app_bar.dart';
import 'package:hebtus_crossplatform/Models/events.dart';
import 'package:hebtus_crossplatform/screens/SeeMorePage/component/events.dart';
class SeeMore extends StatelessWidget {
   SeeMore({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          
          child: Column(children: [
            GridView.count(
                      childAspectRatio: 0.85,
                      crossAxisCount: (MediaQuery.of(context).orientation ==
                              Orientation.landscape)
                          ? 4
                          : 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (var i = 0; i < 6; i++) EventSeeMore(num: i),
                      ],
                    ),
          ]),
          ),
      ));
  }
}

